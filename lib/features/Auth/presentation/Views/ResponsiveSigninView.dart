import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/ResponsiveLayout%20.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/SignInViewDeskTopLayout.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/SignInViewMobileLayout.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';

class ResponsiveSigninView extends StatelessWidget {
  const ResponsiveSigninView({super.key});
  static String routeName = "/ResponsiveSigninView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
      child: ResponsiveLayout(
        mobile: SignInViewMobileLayout(),
        desktop: SignInViewDeskTopLayout(),
      ),
    );
  }
}
