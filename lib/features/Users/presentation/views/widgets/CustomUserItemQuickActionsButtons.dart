import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';

class CustomUserItemQuickActionsButtons extends StatelessWidget {
  const CustomUserItemQuickActionsButtons({
    super.key,
    required this.userEntity,
  });

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.verified,
          color: userEntity.isVerified == true ? Colors.green : Colors.red,
          size: 20,
        ),
        const SizedBox(width: 10),
        Visibility(
          visible: userEntity.isBlocked == true,
          child: Icon(FontAwesomeIcons.ban, color: Colors.red, size: 20),
        ),
      ],
    );
  }
}
