import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersDesktopLayout/UsersTabel.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersDesktopLayout/UsersViewHeaderDesktopLayout.dart';

class UsersHeaderAndTableDesktopLayout extends StatelessWidget {
  const UsersHeaderAndTableDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: UsersViewHeaderDesktopLayout()),
        SizedBox(height: 50),
        Expanded(flex: 10, child: UsersTabel()),
      ],
    );
  }
}
