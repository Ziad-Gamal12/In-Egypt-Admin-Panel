// ignore_for_file: use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/core/services/FirebaseAuth_Service.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppLogoWidget.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/ResponsiveSigninView.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/ResponsiveDashBaoardView.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    initNavigation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width / 2.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CustomAppLogoWidget()],
      ),
    );
  }

  void initNavigation(BuildContext context) async {
    bool isSignedIn = await firebaseAuthService().isLoggedIn();
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) {
        return;
      } else {
        if (isSignedIn) {
          GoRouter.of(context).go(ResponsiveDashBaoardView.routeName);
        } else {
          GoRouter.of(context).go(ResponsiveSigninView.routeName);
        }
      }
    });
  }
}
