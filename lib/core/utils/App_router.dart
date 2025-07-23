// ignore_for_file: file_names, camel_case_types
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/ResponsiveSignUpView.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/ResponsiveSigninView.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/ResponsiveBookingsView.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/ResponsiveDashBaoardView.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/ResponsivePlacesView.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/ResponsiveUsersView.dart';

class App_router {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: ResponsiveSigninView.routeName,
        builder: (context, state) => ResponsiveSigninView(),
      ),
      GoRoute(
        path: ResponsiveSignUpView.routeName,
        builder: (context, state) => ResponsiveSignUpView(),
      ),

      GoRoute(
        path: ResponsiveDashBaoardView.routeName,
        builder: (context, state) => ResponsiveDashBaoardView(),
      ),
      GoRoute(
        path: ResponsivePlacesView.routeName,
        builder: (context, state) => ResponsivePlacesView(),
      ),
      GoRoute(
        path: ResponsiveBookingsView.routeName,
        builder: (context, state) => ResponsiveBookingsView(),
      ),
      GoRoute(
        path: ResponsiveUsersView.routeName,
        builder: (context, state) => ResponsiveUsersView(),
      ),
    ],
  );
}
