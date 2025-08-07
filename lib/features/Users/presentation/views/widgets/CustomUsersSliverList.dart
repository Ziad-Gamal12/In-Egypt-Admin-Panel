import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/Variables.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUser_Item.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUser.dart';

class CustomUsersSliverList extends StatelessWidget {
  const CustomUsersSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          bottom: index == Variables.testUsers.length - 1 ? 0 : 10,
        ),
        child: AspectRatio(
          aspectRatio: 4 / 1,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (_) => SelectedUser(user: Variables.testUsers[index]),
              );
            },
            child: CustomUserItem(userEntity: Variables.testUsers[index]),
          ),
        ),
      ),
      itemCount: Variables.testUsers.length,
    );
  }
}
