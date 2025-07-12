// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/Features/Auth/presentation/Views/Widgets/SignInViewWidgets/CustomSocialButton.dart';
import 'package:in_egypt_admin_panel/Features/Auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';

class SigninSocialButtons extends StatelessWidget {
  const SigninSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocialButton(
          text: "تسجيل بواسطة جوجل",
          onPressed: () {
            context.read<SignInCubit>().signInWithGoogle();
          },
          iconpath: Assets.assetsIconsGoogleIcon,
        ),
        const SizedBox(height: 16),
        CustomSocialButton(
          text: "تسجيل بواسطة فيسبوك",
          onPressed: () {
            context.read<SignInCubit>().signInWithFacebook();
          },
          iconpath: Assets.assetsIconsFacebookIcon,
        ),
      ],
    );
  }
}
