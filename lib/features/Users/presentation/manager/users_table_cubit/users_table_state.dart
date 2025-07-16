part of 'users_table_cubit.dart';

@immutable
sealed class UsersTableState {}

final class UsersTableInitial extends UsersTableState {}

final class UsersTableOnCellTap extends UsersTableState {
  final UserEntity userEntity;
  UsersTableOnCellTap({required this.userEntity});
}
