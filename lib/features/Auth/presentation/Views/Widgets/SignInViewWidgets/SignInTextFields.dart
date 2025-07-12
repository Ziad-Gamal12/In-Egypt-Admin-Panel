import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomEmailTextField.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomPasswordTextField.dart';

class SignInTextFields extends StatefulWidget {
  const SignInTextFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  State<SignInTextFields> createState() => _SignInTextFieldsState();
}

class _SignInTextFieldsState extends State<SignInTextFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomEmailTextField(),
        SizedBox(height: 20),
        CustomPasswordTextField(),
      ],
    );
  }
}
