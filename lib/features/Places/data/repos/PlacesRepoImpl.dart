import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:in_egypt_admin_panel/core/Entities/FireStorePaginateResponse.dart';
import 'package:in_egypt_admin_panel/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';
import 'package:in_egypt_admin_panel/core/models/PlaceModel.dart';
import 'package:in_egypt_admin_panel/core/services/DataBaseService.dart';
import 'package:in_egypt_admin_panel/core/services/StorageService.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Entities/GetplacesResponseEntity.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';

class PlacesRepoImpl implements PlacesRepo {
  final Databaseservice databaseservice;
  final StorageService storageService;
  PlacesRepoImpl({required this.storageService, required this.databaseservice});
  @override
  Future<Either<Failure, void>> addPlace({
    required PlaceEntity placeEntity,
  }) async {
    try {
      Map<String, dynamic> data = PlaceModel.fromEntity(placeEntity).toJson();
      bool isExists = await databaseservice.isDataExists(
        key: Backendkeys.placesCollection,
        docId: placeEntity.id,
      );
      if (!isExists) {
        final addPlaceResult = await databaseservice.setData(
          data: data,
          requirements: FireStoreRequirmentsEntity(
            collection: Backendkeys.placesCollection,
            docId: placeEntity.id,
          ),
        );
        return right(addPlaceResult);
      } else {
        return left(ServerFailure(message: "الرقم التعريفي موجود بالفعل"));
      }
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePlace({required String placeId}) async {
    try {
      final deletePlaceResult = await databaseservice.deleteDoc(
        collectionKey: Backendkeys.placesCollection,
        docId: placeId,
      );
      return right(deletePlaceResult);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePlace({
    required PlaceEntity placeEntity,
  }) async {
    try {
      Map<String, dynamic> data = PlaceModel.fromEntity(placeEntity).toJson();
      final updatePlaceResult = await databaseservice.updateData(
        data: data,
        doc: placeEntity.id,
        collectionKey: Backendkeys.placesCollection,
      );
      return right(updatePlaceResult);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  Map<String, dynamic> query = {
    "orderBy": "createdAt",
    "limit": 10,
    "startAfter": null,
  };
  DocumentSnapshot<Object?>? lastDocumentSnapshot;
  @override
  Future<Either<Failure, GetplacesResponseEntity>> getPlaces({
    required bool isPaginated,
  }) async {
    try {
      if (isPaginated) query["startAfter"] = lastDocumentSnapshot;
      FireStorePaginateResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.placesCollection,
        ),
        query: query,
      );

      final placesData = response.listData ?? [];

      if (placesData.isNotEmpty && response.lastDocumentSnapshot != null) {
        lastDocumentSnapshot = response.lastDocumentSnapshot;
      }

      List<PlaceEntity> placesEntity = placesData
          .map((e) => PlaceModel.fromJson(e).toEntity())
          .toList();

      bool hasMore = placesData.length == query["limit"];

      return right(
        GetplacesResponseEntity(places: placesEntity, hasMore: hasMore),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e, s) {
      log("getPlaces Exception: ${e.toString()}");
      log("getPlaces StackTrace: ${s.toString()}");
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> uploadPlaceImages({
    required List images,
  }) async {
    try {
      List<String> urls = [];
      if (images.isNotEmpty) {
        for (final image in images.where((e) => e != null)) {
          if (image != null) {
            if (image is ImagePickerResult) {
              if (image.files != null && image.files!.isNotEmpty) {
                List<File> files = image.files!;
                List<String> filesUrls = await uplaodImagesFile(
                  fileNames: image.fileNames,
                  files: files,
                );
                urls.addAll(filesUrls);
              } else if (image.bytes != null && image.bytes!.isNotEmpty) {
                List<Uint8List> bytes = image.bytes!;
                List<String> bytesUrls = await uploadImagesUnit8List(
                  fileNames: image.fileNames,
                  files: bytes,
                );
                urls.addAll(bytesUrls);
              }
            }
          }
        }
        return right(urls);
      } else {
        return right([]);
      }
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  Future<List<String>> uplaodImagesFile({
    required List<File> files,
    required List<String> fileNames,
  }) async {
    List<String> urls = [];
    for (int i = 0; i < files.length; i++) {
      String url = await storageService.uploadFile(
        file: files[i],
        fileName: fileNames[i],
      );
      urls.add(url);
    }
    return urls;
  }

  Future<List<String>> uploadImagesUnit8List({
    required List<Uint8List> files,
    required List<String> fileNames,
  }) async {
    List<String> urls = [];
    for (int i = 0; i < files.length; i++) {
      String url = await storageService.uploadFile(
        bytes: files[i],
        fileName: fileNames[i],
      );
      urls.add(url);
    }
    return urls;
  }
}
