import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomCachedNetworkImage.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

class SelectedUserDesktopLayout extends StatelessWidget {
  const SelectedUserDesktopLayout({super.key, required this.user});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: CustomCachedNetworkImage(
              imageUrl: user.photoUrl.isEmpty
                  ? "https://cdn-icons-png.flaticon.com/128/16683/16683419.png"
                  : user.photoUrl,
            ),
          ),
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
                Custombutton(
                  text: "تفعيل",
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                Custombutton(
                  text: "حظر",
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles(
                context,
              ).regular16.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
