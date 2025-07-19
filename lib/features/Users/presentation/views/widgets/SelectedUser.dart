import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUserActionButtons.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUser_UserProfileImage.dart';

class SelectedUser extends StatelessWidget {
  const SelectedUser({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SelectedUserUserProfileImage(),
            const SizedBox(height: 10),
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
                  SelectedUserActionButtons(),
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
          Divider(height: 1, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}
