import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SelectUserRole.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpAgreementRow.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpButtonSection.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpConfirmPasswordField.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpEmailField.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpNameFields.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpPasswordField.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpPhoneField.dart';

class SignUpFieldsList extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isTermsAccepted;
  final String role;
  final ValueChanged<bool?> onTermsChanged;
  final ValueChanged<String?> onRoleChanged;

  const SignUpFieldsList({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isTermsAccepted,
    required this.onTermsChanged,
    required this.role,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SignUpNameFields(),
        const SizedBox(height: 20),
        const SignUpEmailField(),
        const SizedBox(height: 20),
        const SignUpPhoneField(),
        const SizedBox(height: 20),
        SignUpPasswordField(passwordController: passwordController),
        const SizedBox(height: 20),
        SignUpConfirmPasswordField(
          confirmPasswordController: confirmPasswordController,
        ),
        const SizedBox(height: 20),
        SelectUserRole(roleChanaged: onRoleChanged),
        const SizedBox(height: 20),
        SignUpAgreementRow(onChanged: onTermsChanged),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
        SignUpButtonSection(
          isTermsAccepted: isTermsAccepted,
          passwordController: passwordController,
          role: role,
          confirmPasswordController: confirmPasswordController,
          formKey: formKey,
        ),
      ],
    );
  }
}
