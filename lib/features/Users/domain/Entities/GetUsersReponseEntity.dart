import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

class GetUsersReponseEntity {
  final List<UserEntity> usersList;
  final bool hasMore;

  GetUsersReponseEntity({required this.usersList, required this.hasMore});
}
