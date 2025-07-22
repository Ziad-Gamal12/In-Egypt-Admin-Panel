import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppBar.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomSignInViewBody.dart';

class SignInViewMobileLayout extends StatelessWidget {
  const SignInViewMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "تسجيل الدخول"),
      body: CustomSignInViewBody(),
    );
  }
}
