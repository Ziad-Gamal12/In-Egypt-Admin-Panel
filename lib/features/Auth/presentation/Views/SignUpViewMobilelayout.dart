import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppBar.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpViewBody.dart';

class SignUpViewMobilelayout extends StatelessWidget {
  const SignUpViewMobilelayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "تسجيل حساب جديد"),
      body: SignUpViewBody(),
    );
  }
}
