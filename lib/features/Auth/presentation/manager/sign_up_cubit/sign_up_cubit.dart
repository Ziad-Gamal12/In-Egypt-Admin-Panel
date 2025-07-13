// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../domain/Repos/AuthRepo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());
  final AuthRepo authRepo;
  Future<void> signUpWithEmailAndPassword({
    required UserEntity userEntity,
    required String password,
  }) async {
    emit(SignUpLoading());
    final result = await authRepo.signUpWithEmailAndPassword(
      userEntity: userEntity,
      password: password,
    );
    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (success) => emit(SignUpSuccess()),
    );
  }
}
