// ignore_for_file: file_names, non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:in_egypt_admin_panel/core/services/DataBaseService.dart';
import 'package:in_egypt_admin_panel/core/services/FirebaseAuth_Service.dart';
import 'package:in_egypt_admin_panel/core/services/Firebase_FirestoreService.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/services/firebaseStorageService.dart';
import 'package:in_egypt_admin_panel/core/services/picker_assets_interface.dart';
import 'package:in_egypt_admin_panel/core/services/picker_assets_service.dart';
import 'package:in_egypt_admin_panel/features/Auth/data/Repos/AuthRepoImpl.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Repos/AuthRepo.dart';
import 'package:in_egypt_admin_panel/features/Places/data/repos/PlacesRepoImpl.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';

final getIt = GetIt.instance;

void setup_Getit() {
  getIt.registerSingleton<firebaseAuthService>(firebaseAuthService());
  getIt.registerSingleton<PickerAssetsInterface>(PickerAssetsService());

  getIt.registerSingleton<firebasestorageservice>(
    firebasestorageservice(pickerassetsservice: getIt<PickerAssetsInterface>()),
  );
  getIt.registerSingleton<StorageService>(getIt<firebasestorageservice>());
  getIt.registerSingleton<Databaseservice>(FirebaseFirestoreservice());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authService: getIt<firebaseAuthService>(),
      databaseservice: getIt<Databaseservice>(),
    ),
  );
  getIt.registerSingleton<PlacesRepo>(
    PlacesRepoImpl(
      databaseservice: getIt<Databaseservice>(),
      storageService: getIt<StorageService>(),
    ),
  );
}
