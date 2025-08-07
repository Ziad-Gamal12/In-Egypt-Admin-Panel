// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'UsersState.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
}
