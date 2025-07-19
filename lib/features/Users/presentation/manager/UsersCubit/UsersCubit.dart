// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:meta/meta.dart';

part 'UsersState.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  void onCellTap({required UserEntity userEntity}) {
    {
      emit(UsersOnTap(userEntity: userEntity));
    }
  }
}
