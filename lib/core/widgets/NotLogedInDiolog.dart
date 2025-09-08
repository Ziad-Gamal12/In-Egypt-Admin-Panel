// logout_dialog.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/ResponsiveSigninView.dart';

class NotLogedInDiolog extends StatelessWidget {
  const NotLogedInDiolog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 60),
        child: Text(
          "أنتهت مهلة تسجيل الدخول، يرجى تسجيل الدخول مرة اخرى",
          style: AppTextStyles(
            context,
          ).regular13.copyWith(color: kMainColor, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: Custombutton(
            onPressed: () async {
              if (context.mounted) {
                GoRouter.of(context).go(ResponsiveSigninView.routeName);
              }
            },
            text: "تسجيل الدخول",
            color: kMainColor,
            textColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
