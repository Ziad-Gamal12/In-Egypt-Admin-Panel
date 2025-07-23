import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:in_egypt_admin_panel/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';
import 'package:in_egypt_admin_panel/core/models/PlaceModel.dart';
import 'package:in_egypt_admin_panel/core/services/DataBaseService.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Repos/PlacesRepo.dart';

class PlacesRepoImpl implements PlacesRepo {
  final Databaseservice databaseservice;
  PlacesRepoImpl({required this.databaseservice});
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

  @override
  Future<Either<Failure, List<PlaceEntity>>> getPlaces() async {
    try {
      List places = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.placesCollection,
        ),
        query: {"orderBy": "createdAt", "limit": 10, "isPaginate": true},
      );
      List<PlaceEntity> placesEntity = places
          .map((e) => PlaceModel.fromJson(e).toEntity())
          .toList();
      return right(placesEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e, s) {
      log("getPlaces Exception: ${e.toString()}");
      log("getPlaces StackTrace: ${s.toString()}");
      return left(ServerFailure(message: e.toString()));
    }
  }
}
