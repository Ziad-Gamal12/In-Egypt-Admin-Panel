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

// getSearchedUsers
final class UsersGetSearchedUsersLoading extends UsersState {}

final class UsersGetSearchedUsersSuccess extends UsersState {
  final GetUsersReponseEntity response;
  UsersGetSearchedUsersSuccess(this.response);
}

final class UsersGetSearchedUsersFailure extends UsersState {
  final String errMessage;
  UsersGetSearchedUsersFailure(this.errMessage);
}
