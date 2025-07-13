import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpViewBodyDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpViewBodyMobileAndTabletLayout.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = '/sign-up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constrains) =>
              getlayout(maxWidth: constrains.maxWidth),
        ),
      ),
    );
  }

  Widget getlayout({required double maxWidth}) {
    if (maxWidth < 1024) {
      return SignUpViewBodyMobileAndTabletLayout();
    } else {
      return SignUpViewBodyDesktopLayout();
    }
  }
}
