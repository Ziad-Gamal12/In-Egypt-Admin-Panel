// ignore_for_file: file_names, non_constant_identifier_names

import 'package:get_it/get_it.dart';
import 'package:in_egypt_admin_panel/core/services/DataBaseService.dart';
import 'package:in_egypt_admin_panel/core/services/FirebaseAuth_Service.dart';
import 'package:in_egypt_admin_panel/core/services/Firebase_FirestoreService.dart';
import 'package:in_egypt_admin_panel/core/services/PickerAssetsService.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/services/firebaseStorageService.dart';
import 'package:in_egypt_admin_panel/features/Auth/data/Repos/AuthRepoImpl.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Repos/AuthRepo.dart';

final getIt = GetIt.instance;

void setup_Getit() {
  getIt.registerSingleton<firebaseAuthService>(firebaseAuthService());
  getIt.registerSingleton<firebasestorageservice>(
    firebasestorageservice(pickerassetsservice: Pickerassetsservice()),
  );
  getIt.registerSingleton<StorageService>(getIt<firebasestorageservice>());
  getIt.registerSingleton<Databaseservice>(FirebaseFirestoreservice());
  getIt.registerSingleton<Pickerassetsservice>(Pickerassetsservice());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authService: getIt<firebaseAuthService>(),
      databaseservice: getIt<Databaseservice>(),
    ),
  );
}
