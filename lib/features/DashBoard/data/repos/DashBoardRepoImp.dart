import 'package:dartz/dartz.dart';
import 'package:in_egypt_admin_panel/core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:in_egypt_admin_panel/core/errors/Exceptioons.dart';
import 'package:in_egypt_admin_panel/core/errors/Failures.dart';
import 'package:in_egypt_admin_panel/core/services/DataBaseService.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/DashBoardInfoEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/repos/DashBoardRepo.dart';

class DashBoardRepoImp implements DashBoardRepo {
  final Databaseservice databaseservice;
  DashBoardRepoImp({required this.databaseservice});
  @override
  Future<Either<Failure, DashBoardInfoEntity>> getDashBoardInfo() async {
    try {
      int users = await databaseservice.getCollectionItemsCount(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.usersCollection,
        ),
      );
      int places = await databaseservice.getCollectionItemsCount(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.placesCollection,
        ),
      );
      int bookings = await databaseservice.getCollectionItemsCount(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.bookingsCollection,
        ),
      );
      int admins = await databaseservice.getCollectionItemsCount(
        requirements: FireStoreRequirmentsEntity(
          collection: Backendkeys.usersCollection,
        ),
        query: {"role": Backendkeys.userRole, "operator": "!="},
      );
      int totalPlacesCount = places;
      int totalBookingsCount = bookings;
      int totalUsersCount = users;
      int totalAdminsCount = admins;

      DashBoardInfoEntity result = DashBoardInfoEntity(
        totalPlacesCount: totalPlacesCount,
        totalBookingsCount: totalBookingsCount,
        totalUsersCount: totalUsersCount,
        totalAdminsCount: totalAdminsCount,
      );
      return Right(result);
    } on CustomException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      return Left(ServerFailure(message: "حدث خطأ ما"));
    }
  }
}
