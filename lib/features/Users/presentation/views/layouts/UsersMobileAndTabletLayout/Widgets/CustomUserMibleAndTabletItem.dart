import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomScaleAnimatedWidget.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersMobileAndTabletLayout/Widgets/CustomUserMibleAndTabletUserInfo.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersMobileAndTabletLayout/Widgets/CustomUserMibleAndTabletUserProfilePic.dart';

class CustomUserMibleAndTabletItem extends StatelessWidget {
  const CustomUserMibleAndTabletItem({super.key, required this.userEntity});
  final UserEntity userEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<UsersCubit>().onCellTap(userEntity: userEntity);
      },
      child: CustomScaleAnimatedWidget(
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xffF3F3F3), width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomUserMibleAndTabletUserProfilePic(
                  profilePicUrl: userEntity.photoUrl,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 6,
                child: CustomUserMibleAndTabletUserInfo(userEntity: userEntity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
