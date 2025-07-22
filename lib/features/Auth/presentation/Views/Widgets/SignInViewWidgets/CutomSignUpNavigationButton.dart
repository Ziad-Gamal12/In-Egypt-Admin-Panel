import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/ResponsiveSignUpView.dart';

class CutomSignUpNavigationButton extends StatelessWidget {
  const CutomSignUpNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Custombutton(
      text: "انشاء حساب",
      color: Colors.white,
      textColor: Colors.black,
      onPressed: () {
        GoRouter.of(context).push(ResponsiveSignUpView.routeName);
      },
      side: BorderSide(color: Colors.grey),
    );
  }
}
