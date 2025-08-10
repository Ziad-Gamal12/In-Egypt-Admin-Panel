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
}
