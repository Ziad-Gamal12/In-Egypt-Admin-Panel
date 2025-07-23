import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/ResponsiveLayout%20.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/DashboardViewDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/DashboardViewMobileLayout.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';

class ResponsiveDashBaoardView extends StatelessWidget {
  const ResponsiveDashBaoardView({super.key});
  static String routeName = "/DashBaoardView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(placesRepo: getIt.get<PlacesRepo>()),
      child: ResponsiveLayout(
        mobile: const DashboardViewMobileLayout(),
        desktop: const DashboardViewDesktopLayout(),
      ),
    );
  }
}
