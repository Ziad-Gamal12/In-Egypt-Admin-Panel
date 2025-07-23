import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawer.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersMobileAndTabletLayout/UsersViewBodyMobileAndTabletLayout.dart';

class UsersViewMobileLayout extends StatefulWidget {
  const UsersViewMobileLayout({super.key});
  @override
  State<UsersViewMobileLayout> createState() => _UsersViewMobileLayoutState();
}

class _UsersViewMobileLayoutState extends State<UsersViewMobileLayout> {
  int currentIndex = 3;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: Scaffold(
        appBar: CustomAppBar(appBartitle: "المستخدمين"),
        drawer: CustomDrawer(currentIndex: currentIndex),
        body: UsersViewBodyMobileAndTabletLayout(),
      ),
    );
  }
}
