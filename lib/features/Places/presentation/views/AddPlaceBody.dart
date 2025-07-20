import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/services/PickerAssetsService.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/AddPlaceBodyContent.dart';
import 'package:provider/provider.dart';

class AddPlaceBody extends StatefulWidget {
  const AddPlaceBody({super.key});

  @override
  State<AddPlaceBody> createState() => _AddPlaceBodyState();
}

class _AddPlaceBodyState extends State<AddPlaceBody> {
  PlaceEntity place = PlaceEntity(
    id: '',
    location: '',
    category: '',
    name: '',
    description: '',
    images: [''],
    latitude: 0,
    longitude: 0,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    rating: 0,
    ticketPrice: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit(
        pickerassetsservice: getIt.get<Pickerassetsservice>(),
        storageService: getIt.get<StorageService>(),
      ),
      child: Provider.value(value: place, child: AddPlaceBodyContent()),
    );
  }
}
