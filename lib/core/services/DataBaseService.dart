// ignore_for_file: file_names

import 'package:in_egypt_admin_panel/core/Entities/FireStorePaginateResponse.dart';
import 'package:in_egypt_admin_panel/core/Entities/FireStoreRequirmentsEntity.dart';

abstract class Databaseservice {
  Future<void> setData({
    required Map<String, dynamic> data,
    required FireStoreRequirmentsEntity requirements,
  });
  Future<FireStorePaginateResponse> getData({
    required FireStoreRequirmentsEntity requirements,
    Map<String, dynamic>? query,
  });
  Future<bool> isDataExists({
    required String key,
    required String docId,
    String? subCollectionKey,
    String? subDocId,
  });
  Future<bool> isFeildExists({
    required String key,
    required String feild,
    required String feildValue,
  });

  Future<void> updateData({
    required String collectionKey,
    required doc,
    required dynamic data,
    String? field,
    String? subCollectionKey,
    String? subDocId,
  });
  Future<void> deleteDoc({
    required String collectionKey,
    required String docId,

    String? subCollectionKey,
    String? subDocId,
  });
  Future<int> getCollectionItemsCount({
    required FireStoreRequirmentsEntity requirements,
    Map<String, dynamic>? query,
  });
}
