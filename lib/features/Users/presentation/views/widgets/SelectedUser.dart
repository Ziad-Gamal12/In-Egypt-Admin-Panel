import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/domain/repos/UsersRepo.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUserBody.dart';

class SelectedUser extends StatelessWidget {
  const SelectedUser({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(usersRepo: getIt.get<UsersRepo>()),
      child: SelectedUserBody(user: user),
    );
  }
}
