import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/services/PickerAssetsService.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/ManagePlacesViewBodyContent.dart';

class ManagePlacesViewBody extends StatefulWidget {
  const ManagePlacesViewBody({super.key});

  @override
  State<ManagePlacesViewBody> createState() => _ManagePlacesViewBodyState();
}

class _ManagePlacesViewBodyState extends State<ManagePlacesViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit(
        pickerassetsservice: getIt.get<Pickerassetsservice>(),
        storageService: getIt.get<StorageService>(),
        placesRepo: getIt.get<PlacesRepo>(),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: kHorizentalPadding,
          vertical: kVerticalPadding,
        ),
        child: ManagePlacesViewBodyContent(),
      ),
    );
  }
}
