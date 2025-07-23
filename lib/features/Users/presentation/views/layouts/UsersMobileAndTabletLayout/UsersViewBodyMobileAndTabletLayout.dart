import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersMobileAndTabletLayout/Widgets/CustomUsersContentBody.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUser.dart';

class UsersViewBodyMobileAndTabletLayout extends StatelessWidget {
  const UsersViewBodyMobileAndTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersOnTap) {
            return Row(
              children: [
                Expanded(flex: 3, child: CustomUsersContentBody()),
                Expanded(flex: 2, child: SelectedUser(user: state.userEntity)),
              ],
            );
          } else {
            return CustomUsersContentBody();
          }
        },
      ),
    );
  }
}
