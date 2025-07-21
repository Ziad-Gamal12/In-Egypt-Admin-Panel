import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/services/PickerAssetsService.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/PlaceDetailsViewBodyContent.dart';

class PlaceDetailsViewBody extends StatelessWidget {
  const PlaceDetailsViewBody({super.key, required this.place});
  final PlaceEntity place;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit(
        pickerassetsservice: getIt.get<Pickerassetsservice>(),
        storageService: getIt.get<StorageService>(),
        placesRepo: getIt.get<PlacesRepo>(),
      ),
      child: PlaceDetailsViewBodyContent(place: place),
    );
  }
}
