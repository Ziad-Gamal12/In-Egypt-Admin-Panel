import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/users_table_cubit/users_table_cubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersDesktopLayout/SelectedUserDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersDesktopLayout/UsersHeaderAndTableDesktopLayout.dart';

class UsersDesktopLayout extends StatefulWidget {
  const UsersDesktopLayout({super.key});

  @override
  State<UsersDesktopLayout> createState() => _UsersDesktopLayoutState();
}

class _UsersDesktopLayoutState extends State<UsersDesktopLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersTableCubit, UsersTableState>(
      builder: (context, state) {
        if (state is UsersTableOnCellTap) {
          return Row(
            children: [
              Expanded(flex: 3, child: UsersHeaderAndTableDesktopLayout()),
              Expanded(
                child: SelectedUserDesktopLayout(user: state.userEntity),
              ),
            ],
          );
        } else {
          return UsersHeaderAndTableDesktopLayout();
        }
      },
    );
  }
}
