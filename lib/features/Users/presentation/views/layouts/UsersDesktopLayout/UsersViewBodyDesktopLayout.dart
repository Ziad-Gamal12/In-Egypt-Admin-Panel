import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersDesktopLayout/Widgets/UsersContentBodyDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUser.dart';

class UsersViewBodyDesktopLayout extends StatefulWidget {
  const UsersViewBodyDesktopLayout({super.key});

  @override
  State<UsersViewBodyDesktopLayout> createState() =>
      _UsersViewBodyDesktopLayoutState();
}

class _UsersViewBodyDesktopLayoutState
    extends State<UsersViewBodyDesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersOnTap) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: UsersContentBodyDesktopLayout()),
                Expanded(child: SelectedUser(user: state.userEntity)),
              ],
            );
          } else {
            return UsersContentBodyDesktopLayout();
          }
        },
      ),
    );
  }
}
