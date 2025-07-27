import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/core/services/picker_assets_interface.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawer.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/ManagePlacesViewBody.dart';

class PlacesViewMobileLayout extends StatefulWidget {
  const PlacesViewMobileLayout({super.key});
  @override
  State<PlacesViewMobileLayout> createState() => _PlacesViewMobileLayoutState();
}

class _PlacesViewMobileLayoutState extends State<PlacesViewMobileLayout> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit(
        pickerassetsservice: getIt.get<PickerAssetsInterface>(),
        storageService: getIt.get<StorageService>(),
        placesRepo: getIt.get<PlacesRepo>(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(appBartitle: "الأماكن"),
        drawer: CustomDrawer(currentIndex: currentIndex),
        body: ManagePlacesViewBody(),
      ),
    );
  }
}
