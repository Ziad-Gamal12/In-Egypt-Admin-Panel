import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/CustomSignUpWelcomePanel.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpViewBody.dart';

class SignUpViewBodyDesktopLayout extends StatelessWidget {
  const SignUpViewBodyDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: CustomSignUpWelcomePanel()),
        Expanded(flex: 2, child: SignUpViewBody()),
      ],
    );
  }
}
