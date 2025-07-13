import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';

class CustomSignInActionButton extends StatelessWidget {
  const CustomSignInActionButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Custombutton(
      text: "تسجيل الدخول",
      color: kMainColor,
      textColor: Colors.black,
      onPressed: () {
        if (formKey.currentState!.validate()) {
          context.read<SignInCubit>().signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
        }
      },
    );
  }
}
