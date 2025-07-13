import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomSignInViewBody.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomSigninWelcomePanel.dart';

class SignInViewBodyDesktopLayout extends StatelessWidget {
  const SignInViewBodyDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomSignInViewBody()),
        Expanded(child: CustomSigninWelcomePanel()),
      ],
    );
  }
}
