import 'package:dartz/dartz.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';
import 'package:in_egypt_admin_panel/features/Users/domain/Entities/GetUsersReponseEntity.dart';

abstract class UsersRepo {
  Future<Either<Failure, GetUsersReponseEntity>> getUsers({
    required bool isPaginated,
  });
  Future<Either<Failure, GetUsersReponseEntity>> getSearchedUsers({
    required String searchKey,
  });
}
