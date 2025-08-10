import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Splash/presentation/views/widgets/SplashViewBody.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody());
  }
}
