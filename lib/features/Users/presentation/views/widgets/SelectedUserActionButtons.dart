import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/helpers/getUserData.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';

class SelectedUserActionButtons extends StatelessWidget {
  const SelectedUserActionButtons({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        return Visibility(
          visible: haveAccess(),
          child: Column(
            children: [
              if (state is UsersChangeUserVerificationStateLoading)
                Center(
                  child: const CircularProgressIndicator(color: Colors.blue),
                )
              else
                Custombutton(
                  borderRadius: BorderRadius.circular(8),
                  text: user.isVerified == true ? "تعطيل" : "تفعيل",
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<UsersCubit>().changeUserVerification(
                      isVerified: user.isVerified,
                      userId: user.uid,
                    );
                  },
                ),
              const SizedBox(height: 10),
              if (state is UsersChangeUserBlockingStateLoading)
                Center(
                  child: const CircularProgressIndicator(color: Colors.red),
                )
              else
                Custombutton(
                  borderRadius: BorderRadius.circular(8),
                  text: user.isBlocked == true ? "الغاء الحظر" : "حظر",
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    context.read<UsersCubit>().changeUserBlock(
                      isBlocked: user.isBlocked,
                      userId: user.uid,
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  bool haveAccess() {
    UserEntity user = getUserData();
    if (user.role == Backendkeys.adminRole) {
      return true;
    } else {
      return false;
    }
  }
}
