import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/ResponsiveLayout%20.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/SignUpViewDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/SignUpViewMobilelayout.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

class ResponsiveSignUpView extends StatefulWidget {
  const ResponsiveSignUpView({super.key});
  static const routeName = '/signUp';

  @override
  State<ResponsiveSignUpView> createState() => _ResponsiveSignUpViewState();
}

class _ResponsiveSignUpViewState extends State<ResponsiveSignUpView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
      child: ResponsiveLayout(
        mobile: const SignUpViewMobilelayout(),
        desktop: const SignUpViewDesktopLayout(),
      ),
    );
  }
}
