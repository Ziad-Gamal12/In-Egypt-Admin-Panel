import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersDesktopLayout/UsersDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersMobileAndTabletLayout/UsersMobileAndTabletLayout.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizentalPadding,
          vertical: kVerticalPadding,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return getDashboardlayoutDesign(
              maxWidth: constraints.maxWidth,
              context: context,
            );
          },
        ),
      ),
    );
  }

  Widget getDashboardlayoutDesign({
    required double maxWidth,
    required BuildContext context,
  }) {
    if (maxWidth <= 715 || MediaQuery.of(context).size.width < 907) {
      return UsersMobileAndTabletLayout();
    } else {
      return UsersDesktopLayout();
    }
  }
}
