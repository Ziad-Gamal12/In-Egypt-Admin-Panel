// ignore_for_file: file_names, camel_case_types
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/SignInView.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/SignUpView.dart';
import 'package:in_egypt_admin_panel/layouts/CustomAdminResponsiveLayout.dart';

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
        path: CustomAdminResponsiceLayout.routeName,
        builder: (context, state) => CustomAdminResponsiceLayout(),
      ),
    ],
  );
}
