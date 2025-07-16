// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:meta/meta.dart';

part 'users_table_state.dart';

class UsersTableCubit extends Cubit<UsersTableState> {
  UsersTableCubit() : super(UsersTableInitial());

  void onCellTap({required UserEntity userEntity}) {
    {
      emit(UsersTableOnCellTap(userEntity: userEntity));
    }
  }
}
