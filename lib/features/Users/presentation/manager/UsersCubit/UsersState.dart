part of 'UsersCubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersOnTap extends UsersState {
  final UserEntity userEntity;
  UsersOnTap({required this.userEntity});
}
