import 'package:flutter/widgets.dart';
import 'package:in_egypt_admin_panel/ResponsiveLayout%20.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/UsersViewDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/UsersViewMobileLayout.dart';

class ResponsiveUsersView extends StatelessWidget {
  const ResponsiveUsersView({super.key});
  static String routeName = '/ResponsiveUsersView';
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: UsersViewMobileLayout(),
      desktop: UsersViewDesktopLayout(),
    );
  }
}
