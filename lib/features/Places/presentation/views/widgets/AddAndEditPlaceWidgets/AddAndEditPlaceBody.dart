import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/core/services/picker_assets_interface.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddAndEditPlaceWidgets/AddAndEditPlaceBodyContent.dart';
import 'package:provider/provider.dart';

class AddAndEditPlaceBody extends StatefulWidget {
  const AddAndEditPlaceBody({super.key, this.place, required this.isEdit});
  final PlaceEntity? place;
  final bool isEdit;
  @override
  State<AddAndEditPlaceBody> createState() => _AddAndEditPlaceBodyState();
}

class _AddAndEditPlaceBodyState extends State<AddAndEditPlaceBody> {
  late PlaceEntity place;
  @override
  void initState() {
    if (widget.place != null) {
      place = widget.place!;
    } else {
      place = PlaceEntity(
        id: '',
        location: '',
        category: '',
        name: '',
        description: '',
        images: [],
        latitude: 0,
        longitude: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        rating: 0,
        ticketPrice: 0,
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlacesCubit(
        pickerassetsservice: getIt.get<PickerAssetsInterface>(),
        storageService: getIt.get<StorageService>(),
        placesRepo: getIt.get<PlacesRepo>(),
      ),
      child: Provider.value(
        value: place,
        child: AddAndEditPlaceBodyContent(isEdit: widget.isEdit),
      ),
    );
  }
}
