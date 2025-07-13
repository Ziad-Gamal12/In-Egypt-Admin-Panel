import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignInViewWidgets/SignInViewBodyDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignInViewWidgets/SignInViewBodyMobileAndTabletLayout.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';

import '../../../../core/services/get_it_Service.dart';
import '../../domain/Repos/AuthRepo.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constrains) {
            return getlayout(maxWidth: constrains.maxWidth);
          },
        ),
      ),
    );
  }

  Widget getlayout({required double maxWidth}) {
    if (maxWidth < 1024) {
      return SignInViewBodyMobileAndTabletLayout();
    } else {
      return SignInViewBodyDesktopLayout();
    }
  }
}
