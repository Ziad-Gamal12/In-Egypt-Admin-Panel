import 'package:flutter/widgets.dart';
import 'package:in_egypt_admin_panel/ResponsiveLayout%20.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/PlacesViewDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/PlacesViewMobileLayout.dart';

class ResponsivePlacesView extends StatelessWidget {
  const ResponsivePlacesView({super.key});
  static const String routeName = '/PlacesView';
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: const PlacesViewMobileLayout(),
      desktop: const PlacesViewDesktopLayout(),
    );
  }
}
