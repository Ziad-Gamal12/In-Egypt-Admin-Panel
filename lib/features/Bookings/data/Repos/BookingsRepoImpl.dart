import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/Entities/FireStorePaginateResponse.dart';
import 'package:in_egypt_admin_panel/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';
import 'package:in_egypt_admin_panel/core/models/BookingModel.dart';
import 'package:in_egypt_admin_panel/core/services/DataBaseService.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/GetBookingsResponseEntity.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Repos/BookingsRepo.dart';

class BookingsRepoImpl implements BookingsRepo {
  final Databaseservice databaseservice;

  BookingsRepoImpl({required this.databaseservice});
  Map<String, dynamic> getBookingsQuery = {
    "limit": 10,
    "orderBy": "createdAt",
    "startAfter": null,
  };
  DocumentSnapshot<Object?>? getBookingslastDocumentSnapshot;

  @override
  Future<Either<Failure, GetBookingsResponseEntity>> getBookings({
    required bool isPaginated,
  }) async {
    try {
      if (isPaginated) {
        getBookingsQuery["startAfter"] = getBookingslastDocumentSnapshot;
      }
      FireStorePaginateResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.bookingsCollection,
        ),
        query: getBookingsQuery,
      );
      final bookings = response.listData ?? [];
      if (bookings.isNotEmpty && response.lastDocumentSnapshot != null) {
        getBookingslastDocumentSnapshot = response.lastDocumentSnapshot;
      }
      if (bookings.isEmpty) {
        return right(GetBookingsResponseEntity(bookings: [], hasMore: false));
      }
      bool hasMore =
          response.hasMore ?? bookings.length == getBookingsQuery["limit"];
      List<BookingEntity> bookingsEntity = response.listData!
          .map((e) => BookingModel.fromJson(e).toEntity())
          .toList();
      GetBookingsResponseEntity getBookingsResponseEntity =
          GetBookingsResponseEntity(bookings: bookingsEntity, hasMore: hasMore);
      return right(getBookingsResponseEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e, s) {
      return left(
        ServerFailure(message: "حدث خطأ ما يرجي المحاولة في وقت لاحق"),
      );
    }
  }

  Map<String, dynamic> searchBookingsQuery = {
    "limit": 10,
    "orderBy": "createdAt",
    "startAfter": null,
    "searchField": "user.fullName",
    "searchValue": "",
  };
  DocumentSnapshot<Object?>? searchBookingslastDocumentSnapshot;
  @override
  Future<Either<Failure, GetBookingsResponseEntity>> getSearchedBookings({
    required String searchKey,
    required bool isPaginated,
  }) async {
    try {
      if (isPaginated) {
        searchBookingsQuery["startAfter"] = searchBookingslastDocumentSnapshot;
      }
      searchBookingsQuery["searchValue"] = searchKey;
      FireStorePaginateResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.bookingsCollection,
        ),
        query: searchBookingsQuery,
      );
      final bookings = response.listData ?? [];
      if (bookings.isNotEmpty && response.lastDocumentSnapshot != null) {
        searchBookingslastDocumentSnapshot = response.lastDocumentSnapshot;
      }
      if (bookings.isEmpty) {
        return right(GetBookingsResponseEntity(bookings: [], hasMore: false));
      }
      bool hasMore =
          response.hasMore ?? bookings.length == searchBookingsQuery["limit"];
      List<BookingEntity> bookingsEntity = response.listData!
          .map((e) => BookingModel.fromJson(e).toEntity())
          .toList();
      GetBookingsResponseEntity getBookingsResponseEntity =
          GetBookingsResponseEntity(bookings: bookingsEntity, hasMore: hasMore);
      return right(getBookingsResponseEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log("error ${e.toString()}");
      return left(
        ServerFailure(message: "حدث خطأ ما يرجي المحاولة في وقت لاحق"),
      );
    }
  }
}
