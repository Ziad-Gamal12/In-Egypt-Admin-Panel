import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:in_egypt_admin_panel/core/Entities/FireStorePaginateResponse.dart';
import 'package:in_egypt_admin_panel/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';
import 'package:in_egypt_admin_panel/core/services/DataBaseService.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/features/Auth/data/Models/UserModel.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/domain/Entities/GetUsersReponseEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/domain/repos/UsersRepo.dart';

class UsersRepoImpl implements UsersRepo {
  final Databaseservice databaseservice;
  UsersRepoImpl({required this.databaseservice});
  Map<String, dynamic> getUsersQuery = {
    "orderBy": "fullName",
    "limit": 10,
    "descending": false,
    "startAfter": null,
  };
  DocumentSnapshot<Object?>? getUserslastDocumentSnapshot;

  @override
  Future<Either<Failure, GetUsersReponseEntity>> getUsers({
    required bool isPaginated,
  }) async {
    try {
      if (isPaginated) {
        getUsersQuery["startAfter"] = getUserslastDocumentSnapshot;
      } else {
        getUsersQuery["startAfter"] = null;
      }
      FireStorePaginateResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.usersCollection,
        ),
        query: getUsersQuery,
      );
      final users = response.listData ?? [];
      if (users.isNotEmpty && response.lastDocumentSnapshot != null) {
        getUserslastDocumentSnapshot = response.lastDocumentSnapshot;
      }
      if (users.isEmpty) {
        return right(GetUsersReponseEntity(usersList: [], hasMore: false));
      }
      bool hasMore = response.hasMore ?? users.length == getUsersQuery["limit"];
      List<UserEntity> usersEntity = response.listData!
          .map((e) => UserModel.fromJson(e).toEntity())
          .toList();
      return right(
        GetUsersReponseEntity(usersList: usersEntity, hasMore: hasMore),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: "حدث خطأ ما"));
    }
  }

  Map<String, String> getSearchedUsersQuery = {
    "searchField": "fullName",
    "searchValue": "",
  };
  @override
  Future<Either<Failure, GetUsersReponseEntity>> getSearchedUsers({
    required String searchKey,
  }) async {
    try {
      getSearchedUsersQuery["searchValue"] = searchKey;
      FireStorePaginateResponse response = await databaseservice.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.usersCollection,
        ),
        query: getSearchedUsersQuery,
      );
      final users = response.listData ?? [];
      if (users.isEmpty) {
        log("users empty");
        return right(GetUsersReponseEntity(usersList: [], hasMore: false));
      }
      bool hasMore = response.hasMore ?? true;
      List<UserEntity> usersEntity = response.listData!
          .map((e) => UserModel.fromJson(e).toEntity())
          .toList();
      return right(
        GetUsersReponseEntity(usersList: usersEntity, hasMore: hasMore),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: "حدث خطأ ما"));
    }
  }
}
