import 'package:dartz/dartz.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';
import 'package:in_egypt_admin_panel/features/Places/domain/Entities/GetplacesResponseEntity.dart';

abstract class PlacesRepo {
  Future<Either<Failure, void>> addPlace({required PlaceEntity placeEntity});
  Future<Either<Failure, void>> deletePlace({required String placeId});
  Future<Either<Failure, void>> updatePlace({required PlaceEntity placeEntity});
  Future<Either<Failure, List<String>>> uploadPlaceImages({
    required List images,
  });
  Future<Either<Failure, GetplacesResponseEntity>> getPlaces({
    required bool isPaginated,
  });
  Future<Either<Failure, List<PlaceEntity>>> searchPlaces({
    required String searchKey,
  });
}
