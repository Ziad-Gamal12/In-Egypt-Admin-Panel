import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/users_table_cubit/users_table_cubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersDesktopLayout/UsersDesktopLayout.dart';

class UsersViewBody extends StatelessWidget {
  const UsersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersTableCubit(),
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
      return SizedBox();
    } else {
      return UsersDesktopLayout();
    }
  }
}
