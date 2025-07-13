import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomSignUpWelcomePanel extends StatelessWidget {
  const CustomSignUpWelcomePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(color: Colors.amberAccent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                Assets.assetsImagesSignUpPanelImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                        "أنشاء حساب جديد!",
                        style: AppTextStyles(
                          context,
                        ).bold32.copyWith(color: Colors.black),
                      )
                      .animate()
                      .moveY(
                        begin: 50,
                        duration: 500.milliseconds,
                        delay: 500.milliseconds,
                      )
                      .fadeIn(duration: 500.milliseconds),

                  SizedBox(height: 20),
                  Text(
                        "تسجيل حساب جديد للوصول للوظائف الخاصة بالتطبيق",
                        style: AppTextStyles(
                          context,
                        ).regular16.copyWith(color: Colors.black),
                      )
                      .animate(delay: 1.seconds)
                      .moveY(
                        begin: 50,
                        duration: 500.milliseconds,
                        delay: 500.milliseconds,
                      )
                      .fadeIn(duration: 500.milliseconds),
                  Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
