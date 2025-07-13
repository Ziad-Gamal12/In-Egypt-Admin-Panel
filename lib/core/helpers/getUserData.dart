import 'dart:convert';

import 'package:in_egypt_admin_panel/core/services/Shared_preferences.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/features/Auth/data/Models/UserModel.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

UserEntity getUserData() {
  String userJsonString = Hive_Services.stringGetter(
    key: Backendkeys.storeUserLocaly,
  );
  Map<String, dynamic> userJson = jsonDecode(userJsonString);
  UserEntity userEntity = UserModel.fromJson(userJson).toEntity();
  return userEntity;
}
