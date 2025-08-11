import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/customRefreshWidget.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/manager/dashboard_cubit/dashboard_cubit.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardBookingsSectionHeader.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardInfoRow.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashBoardPlacesSectionLayout.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomDashboardBookingsSliverGrid.dart';

class CustomDashBoardBody extends StatefulWidget {
  const CustomDashBoardBody({super.key});

  @override
  State<CustomDashBoardBody> createState() => _CustomDashBoardBodyState();
}

class _CustomDashBoardBodyState extends State<CustomDashBoardBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => initActions());
    super.initState();
  }

  void initActions() async {
    final cubit = context.read<DashboardCubit>();
    await cubit.getPlaces(isPaginated: false);
    if (!mounted) return;
    await cubit.getDashBoardBookings();
    if (!mounted) return;

    await cubit.getDashBoardInfo();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Customrefreshwidget(
          onRefresh: () async => initActions(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizentalPadding,
              vertical: kVerticalPadding,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        CustomDashBoardInfoRow(),
                        Divider(height: 40, color: Colors.grey.shade400),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .65,
                      child: CustomDashBoardPlacesSectionLayout(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Divider(height: 40, color: Colors.grey.shade400),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        CustomDashBoardBookingsSectionHeader(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  CustomDashboardBookingsSliverGrid(
                    maxWidth: constraints.maxWidth,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
