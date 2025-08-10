// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:in_egypt_admin_panel/features/Users/domain/Entities/GetUsersReponseEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/domain/repos/UsersRepo.dart';
import 'package:meta/meta.dart';

part 'UsersState.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({required this.usersRepo}) : super(UsersInitial());
  final UsersRepo usersRepo;
  Future<void> getUsers({required bool isPaginated}) async {
    emit(UsersGetUsersLoading());
    final failureOrUser = await usersRepo.getUsers(isPaginated: isPaginated);
    failureOrUser.fold(
      (failure) => emit(UsersGetUsersFailure(failure.message)),
      (response) => emit(UsersGetUsersSuccess(response)),
    );
  }

  Future<void> getSearchedUsers({required String searchKey}) async {
    emit(UsersGetSearchedUsersLoading());
    final failureOrUser = await usersRepo.getSearchedUsers(
      searchKey: searchKey,
    );
    failureOrUser.fold(
      (failure) => emit(UsersGetSearchedUsersFailure(failure.message)),
      (response) => emit(UsersGetSearchedUsersSuccess(response)),
    );
  }

  Future<void> changeUserVerification({
    required bool isVerified,
    required String userId,
  }) async {
    if (isVerified) {
      await unVerifyUser(userId: userId);
    } else {
      await verifyUser(userId: userId);
    }
  }

  Future<void> changeUserBlock({
    required bool isBlocked,
    required String userId,
  }) async {
    if (isBlocked) {
      await unBlockUser(userId: userId);
    } else {
      await blockUser(userId: userId);
    }
  }

  Future<void> verifyUser({required String userId}) async {
    emit(UsersChangeUserVerificationStateLoading());
    final failureOrUser = await usersRepo.verifyUser(userId: userId);
    failureOrUser.fold(
      (failure) =>
          emit(UsersChangeUserVerificationStateFailure(failure.message)),
      (response) => emit(
        UsersChangeUserVerificationStateSuccess("تم أثبات هوية المستخدم بنجاح"),
      ),
    );
  }

  Future<void> blockUser({required String userId}) async {
    emit(UsersChangeUserBlockingStateLoading());
    final failureOrUser = await usersRepo.blockUser(userId: userId);
    failureOrUser.fold(
      (failure) => emit(UsersChangeUserBlockingStateFailure(failure.message)),
      (response) =>
          emit(UsersChangeUserBlockingStateSuccess("تم حظر المستخدم بنجاح")),
    );
  }

  Future<void> unBlockUser({required String userId}) async {
    emit(UsersChangeUserBlockingStateLoading());
    final failureOrUser = await usersRepo.unBlockUser(userId: userId);
    failureOrUser.fold(
      (failure) => emit(UsersChangeUserBlockingStateFailure(failure.message)),
      (response) =>
          emit(UsersChangeUserBlockingStateSuccess("تم فك حظر المستخدم بنجاح")),
    );
  }

  Future<void> unVerifyUser({required String userId}) async {
    emit(UsersChangeUserVerificationStateLoading());
    final failureOrUser = await usersRepo.unVerifyUser(userId: userId);
    failureOrUser.fold(
      (failure) =>
          emit(UsersChangeUserVerificationStateFailure(failure.message)),
      (response) => emit(
        UsersChangeUserVerificationStateSuccess(
          "تم الغاء أثبات هوية المستخدم بنجاح",
        ),
      ),
    );
  }
}
