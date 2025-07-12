// ignore_for_file: file_names, camel_case_types
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/SignInView.dart';

class App_router {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: SignInView.routeName,
        builder: (context, state) => SignInView(),
      ),
    ],
  );
}
