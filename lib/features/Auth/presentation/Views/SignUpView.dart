import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpViewBodyDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/SignUpViewBodyMobileAndTabletLayout.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const routeName = '/sign-up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  UserEntity userEntity = UserEntity(
    firstName: '',
    lastName: '',
    email: '',
    phoneNumber: '',
    isVerified: false,
    isBlocked: false,
    createdAt: DateTime.now().toIso8601String(),
    uid: '',
    photoUrl: '',
    role: '',
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
      child: Provider.value(
        value: userEntity,
        child: Scaffold(
          body: LayoutBuilder(
            builder: (context, constrains) =>
                getlayout(maxWidth: constrains.maxWidth),
          ),
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
