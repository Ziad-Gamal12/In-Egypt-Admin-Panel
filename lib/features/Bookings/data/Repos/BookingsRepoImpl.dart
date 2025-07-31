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
import 'package:in_egypt_admin_panel/features/Bookings/domain/Entities/FilterBookingsEntity.dart';
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
      log(e.message);
      return left(ServerFailure(message: e.message));
    } catch (e, s) {
      log(e.toString(), stackTrace: s);
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

  Map<String, dynamic> filterBookingsQuery = {};
  DocumentSnapshot<Object?>? filterBookingslastDocumentSnapshot;
  @override
  Future<Either<Failure, GetBookingsResponseEntity>> getFilteredBookings({
    required FilterBookingsEntity filterBookingsEntity,
  }) async {
    try {
      filterBookingsQuery = _buildFilterBookingsQuery(filterBookingsEntity);

      FireStorePaginateResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.bookingsCollection,
        ),
        query: filterBookingsQuery,
      );
      if (response.lastDocumentSnapshot != null) {
        filterBookingslastDocumentSnapshot = response.lastDocumentSnapshot;
      }
      if (response.listData!.isEmpty) {
        return right(GetBookingsResponseEntity(bookings: [], hasMore: false));
      }
      bool hasMore =
          response.hasMore ??
          response.listData!.length == filterBookingsQuery["limit"];
      List<BookingEntity> bookingsEntity = response.listData!
          .map((e) => BookingModel.fromJson(e).toEntity())
          .toList();
      GetBookingsResponseEntity getBookingsResponseEntity =
          GetBookingsResponseEntity(bookings: bookingsEntity, hasMore: hasMore);
      return right(getBookingsResponseEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: "حدث خطأ ما يرجي المحاولة في وقت لاحق"),
      );
    }
  }

  Map<String, dynamic> _buildFilterBookingsQuery(
    FilterBookingsEntity filterBookingsEntity,
  ) {
    Map<String, dynamic> query = {
      "limit": 10,
      "orderBy": null,
      "startAfter": null,
    };
    List<Map<String, dynamic>> filters = [];
    if (filterBookingsEntity.bookingID != null) {
      filters.add({
        "field": "id",
        "value": filterBookingsEntity.bookingID,
        "operator": "==",
      });
    }
    if (filterBookingsEntity.status != null) {
      filters.add({
        "field": "status",
        "value": filterBookingsEntity.status,
        "operator": "==",
      });
    }
    if (filterBookingsEntity.startDate != null) {
      Timestamp startAt = Timestamp.fromDate(
        DateTime(
          filterBookingsEntity.startDate!.year,
          filterBookingsEntity.startDate!.month,
          filterBookingsEntity.startDate!.day,
        ),
      );

      Timestamp endAt = filterBookingsEntity.endDate != null
          ? Timestamp.fromDate(
              DateTime(
                filterBookingsEntity.endDate!.year,
                filterBookingsEntity.endDate!.month,
                filterBookingsEntity.endDate!.day + 1,
              ),
            )
          : Timestamp.fromDate(
              DateTime(
                filterBookingsEntity.startDate!.year,
                filterBookingsEntity.startDate!.month,
                filterBookingsEntity.startDate!.day + 1,
              ),
            );

      filters.add({"field": "startAt", "value": startAt, "operator": ">="});
      filters.add({"field": "startAt", "value": endAt, "operator": "<"});
    }

    if (filterBookingsEntity.endDate != null) {
      Timestamp endAt = Timestamp.fromDate(
        DateTime(
          filterBookingsEntity.endDate!.year,
          filterBookingsEntity.endDate!.month,
          filterBookingsEntity.endDate!.day,
        ),
      );
      filters.add({"field": "endAt", "value": endAt, "operator": ">="});
      filters.add({
        "field": "endAt",
        "value": Timestamp.fromDate(endAt.toDate().add(Duration(days: 1))),
        "operator": "<",
      });
    }
    if (filterBookingsEntity.isCreatedAtDescending != null) {
      query["orderBy"] = "createdAt";
      query["descending"] = filterBookingsEntity.isCreatedAtDescending!;
    }
    if (filters.isNotEmpty) {
      query["filters"] = filters;
    }

    return query;
  }
}
