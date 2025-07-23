import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawer.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/ManagePlacesViewBody.dart';

class PlacesViewMobileLayout extends StatefulWidget {
  const PlacesViewMobileLayout({super.key});
  @override
  State<PlacesViewMobileLayout> createState() => _PlacesViewMobileLayoutState();
}

class _PlacesViewMobileLayoutState extends State<PlacesViewMobileLayout> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBartitle: "الأماكن"),
      drawer: CustomDrawer(currentIndex: currentIndex),
      body: ManagePlacesViewBody(),
    );
  }
}
