import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/CustomDrawerItemEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawer.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/BookingsViewBody.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/DashBaordViewBody.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/ManagePlacesViewBody.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/UsersViewBody.dart';

class MobileAndTabletLayout extends StatefulWidget {
  const MobileAndTabletLayout({super.key});

  @override
  State<MobileAndTabletLayout> createState() => _MobileAndTabletLayoutState();
}

class _MobileAndTabletLayoutState extends State<MobileAndTabletLayout> {
  int currentIndex = 0;
  List<Widget> widgets = [
    DashBaordViewBody(),
    ManagePlacesViewBody(),
    BookingsViewBody(),
    UsersViewBody(),
  ];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: CustomDrawer(
        currentIndexChanged: (val) {
          setState(() {
            currentIndex = val;
          });
          if (scaffoldKey.currentState != null) {
            scaffoldKey.currentState!.closeEndDrawer();
          }
        },
      ),
      appBar: CustomAppBar(
        appBartitle: CustomDrawerItemEntity.toList()[currentIndex].title,
      ),
      body: widgets[currentIndex],
    );
  }
}
