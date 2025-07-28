import 'package:dartz/dartz.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntity.dart';

abstract class DashBoardRepo {
  Future<Either<Failure, DashBoardInfoEntity>> getDashBoardInfo();
}
