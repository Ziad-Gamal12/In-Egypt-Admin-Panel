import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/ResponsiveLayout%20.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/UsersViewDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/UsersViewMobileLayout.dart';

class ResponsiveUsersView extends StatelessWidget {
  const ResponsiveUsersView({super.key});
  static String routeName = '/ResponsiveUsersView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UsersCubit>(
      create: (context) => UsersCubit(),
      child: ResponsiveLayout(
        mobile: UsersViewMobileLayout(),
        desktop: UsersViewDesktopLayout(),
      ),
    );
  }
}
