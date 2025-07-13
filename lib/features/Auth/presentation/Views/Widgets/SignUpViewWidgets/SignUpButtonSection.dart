import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:provider/provider.dart';

class SignUpButtonSection extends StatelessWidget {
  const SignUpButtonSection({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isTermsAccepted,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isTermsAccepted;
  @override
  Widget build(BuildContext context) {
    UserEntity userEntity = context.read<UserEntity>();
    return Column(
      children: [
        Custombutton(
          text: "انشاء حساب",
          color: kMainColor,
          textColor: Colors.black,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              if (passwordController.text == confirmPasswordController.text) {
                if (isTermsAccepted) {
                  formKey.currentState!.save();
                  context.read<SignUpCubit>().signUpWithEmailAndPassword(
                    userEntity: userEntity,
                    password: passwordController.text,
                  );
                } else {
                  showWarningSnackBar(
                    context: context,
                    message: "يرجى قبول الشروط والأحكام",
                  );
                }
              } else {
                showErrorSnackBar(
                  context: context,
                  message: "كلمة المرور وتأكيد كلمة المرور غير متطابقتين",
                );
              }
            }
          },
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Text(
            "لديك حساب بالفعل؟",
            textAlign: TextAlign.center,
            style: AppTextStyles(
              context,
            ).regular14.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
