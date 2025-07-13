// ignore_for_file: file_names, camel_case_types
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/SignInView.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/SignUpView.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/BookingsView.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/DashBaordView.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/ManagePlacesView.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/UsersView.dart';

class App_router {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SignInView.routeName,
        builder: (context, state) => SignInView(),
      ),
      GoRoute(
        path: SignUpView.routeName,
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: DashBaordView.routeName,
        builder: (context, state) => DashBaordView(),
      ),
      GoRoute(
        path: BookingsView.routeName,
        builder: (context, state) => BookingsView(),
      ),
      GoRoute(
        path: UsersView.routeName,
        builder: (context, state) => UsersView(),
      ),
      GoRoute(
        path: ManagePlacesView.routeName,
        builder: (context, state) => ManagePlacesView(),
      ),
    ],
  );
}
