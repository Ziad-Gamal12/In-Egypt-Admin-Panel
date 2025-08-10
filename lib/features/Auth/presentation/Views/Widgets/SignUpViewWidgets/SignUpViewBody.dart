import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomLoadingWidget.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpFieldsList.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpFormWrapper.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:provider/provider.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  UserEntity user = UserEntity(
    fullName: '',
    uid: '',
    firstName: '',
    isBlocked: false,
    isVerified: false,
    lastName: '',
    email: '',
    phoneNumber: '',
    photoUrl: 'https://cdn-icons-png.flaticon.com/128/16683/16683419.png',
    role: '',
    createdAt: DateTime.now().toString(),
  );
  bool isTermsAccepted = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String role = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          showSuccessSnackBar(
            context: context,
            message: "تم انشاء الحساب بنجاح",
          );
        } else if (state is SignUpFailure) {
          showErrorSnackBar(context: context, message: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomLoadingWidget(
          isloading: state is SignUpLoading,
          child: SignUpFormWrapper(
            formKey: formKey,
            child: Provider.value(
              value: user,
              child: SignUpFieldsList(
                formKey: formKey,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                isTermsAccepted: isTermsAccepted,
                onTermsChanged: (value) =>
                    setState(() => isTermsAccepted = value ?? false),
                role: role,
                onRoleChanged: (value) => setState(() => role = value ?? ''),
              ),
            ),
          ),
        );
      },
    );
  }
}
