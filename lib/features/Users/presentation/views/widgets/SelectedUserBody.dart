import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUserActionButtons.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUser_UserProfileImage.dart';

class SelectedUserBody extends StatelessWidget {
  const SelectedUserBody({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersCubit, UsersState>(
      listener: (context, state) {
        if (state is UsersChangeUserBlockingStateFailure) {
          GoRouter.of(context).pop();
          showErrorSnackBar(context: context, message: state.errMessage);
        } else if (state is UsersChangeUserBlockingStateSuccess) {
          GoRouter.of(context).pop();

          showSuccessSnackBar(context: context, message: state.message);
        } else if (state is UsersChangeUserVerificationStateFailure) {
          GoRouter.of(context).pop();

          showErrorSnackBar(context: context, message: state.errMessage);
        } else if (state is UsersChangeUserVerificationStateSuccess) {
          GoRouter.of(context).pop();

          showSuccessSnackBar(context: context, message: state.message);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SelectedUserUserProfileImage(imageUrl: user.photoUrl),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildInfoRow(FontAwesomeIcons.idBadge, user.uid, context),
                  _buildInfoRow(
                    FontAwesomeIcons.user,
                    "${user.firstName} ${user.lastName}",
                    context,
                  ),
                  _buildInfoRow(FontAwesomeIcons.envelope, user.email, context),
                  _buildInfoRow(
                    FontAwesomeIcons.phone,
                    user.phoneNumber,
                    context,
                  ),
                  _buildInfoRow(FontAwesomeIcons.userTie, user.role, context),
                  _buildInfoRow(
                    FontAwesomeIcons.certificate,
                    user.isVerified ? "مفعل" : "غير مفعل",
                    context,
                  ),
                  _buildInfoRow(
                    FontAwesomeIcons.solidCircleCheck,
                    user.isBlocked ? "محظور" : "نشط",
                    context,
                  ),
                  const SizedBox(height: 20),
                  SelectedUserActionButtons(user: user),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: Colors.black),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  value,
                  style: AppTextStyles(
                    context,
                  ).regular11.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
