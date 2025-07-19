import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/Variables.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersMobileAndTabletLayout/Widgets/CustomUserMibleAndTabletItem.dart';

class CustomUsersMobileAndTabletSliverList extends StatelessWidget {
  const CustomUsersMobileAndTabletSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          bottom: index == Variables.testUsers.length - 1 ? 0 : 10,
        ),
        child: AspectRatio(
          aspectRatio: 4 / 1,
          child: CustomUserMibleAndTabletItem(
            userEntity: Variables.testUsers[index],
          ),
        ),
      ),
      itemCount: Variables.testUsers.length,
    );
  }
}
