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

final class UsersChangeUserVerificationStateLoading extends UsersState {}

final class UsersChangeUserVerificationStateSuccess extends UsersState {
  final String message;
  UsersChangeUserVerificationStateSuccess(this.message);
}

final class UsersChangeUserVerificationStateFailure extends UsersState {
  final String errMessage;
  UsersChangeUserVerificationStateFailure(this.errMessage);
}

final class UsersChangeUserBlockingStateFailure extends UsersState {
  final String errMessage;
  UsersChangeUserBlockingStateFailure(this.errMessage);
}

final class UsersChangeUserBlockingStateSuccess extends UsersState {
  final String message;
  UsersChangeUserBlockingStateSuccess(this.message);
}

final class UsersChangeUserBlockingStateLoading extends UsersState {}
