part of 'UsersCubit.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersGetUsersLoading extends UsersState {}

final class UsersGetUsersSuccess extends UsersState {
  final GetUsersReponseEntity response;
  UsersGetUsersSuccess(this.response);
}

final class UsersGetUsersFailure extends UsersState {
  final String errMessage;
  UsersGetUsersFailure(this.errMessage);
}
