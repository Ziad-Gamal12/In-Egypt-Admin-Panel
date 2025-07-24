import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/services/PickerAssetsService.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawerContent.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingsViewBody.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardDesktopLayout/DashboardDesktopLayout.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/ManagePlacesViewBody.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersDesktopLayout/UsersViewBodyDesktopLayout.dart';

class CustomDesktopDeshBaordLayoutWidget extends StatefulWidget {
  const CustomDesktopDeshBaordLayoutWidget({
    super.key,
    required this.currentIndex,
  });
  final int currentIndex;
  @override
  State<CustomDesktopDeshBaordLayoutWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomDesktopDeshBaordLayoutWidget> {
  int currentIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() {
        currentIndex = widget.currentIndex;
      }),
    );
    super.initState();
  }

  List<Widget> widgets(BuildContext context) => [
    Dashboarddesktoplayout(),
    ManagePlacesViewBody(),
    BookingsViewBody(),
    UsersViewBodyDesktopLayout(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit(
        pickerassetsservice: getIt.get<Pickerassetsservice>(),
        storageService: getIt.get<StorageService>(),
        placesRepo: getIt.get<PlacesRepo>(),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomDrawerContent(
              currentIndex: currentIndex,
              currentIndexChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ),
          Expanded(flex: 5, child: widgets(context)[currentIndex]),
        ],
      ),
    );
  }
}
