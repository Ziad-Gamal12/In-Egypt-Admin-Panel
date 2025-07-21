import 'package:dartz/dartz.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';

abstract class PlacesRepo {
  Future<Either<Failure, void>> addPlace({required PlaceEntity placeEntity});
  Future<Either<Failure, void>> deletePlace({required String placeId});
  Future<Either<Failure, void>> updatePlace({required PlaceEntity placeEntity});
  Future<Either<Failure, List<PlaceEntity>>> getPlaces();
}
