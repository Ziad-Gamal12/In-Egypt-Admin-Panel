import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/helpers/getUserData.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomUserCirclurWIdget.dart';

class CustomDrawerUserinfo extends StatelessWidget {
  const CustomDrawerUserinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomUserCirclurWidget(imageUrl: getUserData().photoUrl),
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "مرحبا بك",
                style: AppTextStyles(
                  context,
                ).bold16.copyWith(color: Colors.white),
              ),
              SizedBox(height: 5),
              Wrap(
                children: [
                  Text(
                    "${getUserData().firstName} ${getUserData().lastName}",
                    style: AppTextStyles(
                      context,
                    ).medium12.copyWith(color: kMainColor),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "(${getUserData().role})",
                    style: AppTextStyles(
                      context,
                    ).medium12.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
