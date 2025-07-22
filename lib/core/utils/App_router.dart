// ignore_for_file: file_names, camel_case_types
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/ResponsiveSignUpView.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/ResponsiveSigninView.dart';
import 'package:in_egypt_admin_panel/layouts/CustomAdminResponsiveLayout.dart';

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
        path: CustomAdminResponsiceLayout.routeName,
        builder: (context, state) => CustomAdminResponsiceLayout(),
      ),
    ],
  );
}
