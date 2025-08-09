import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUser_Item.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/SelectedUser.dart';

class CustomUsersSliverList extends StatelessWidget {
  const CustomUsersSliverList({
    super.key,
    required this.width,
    required this.users,
  });
  final double width;
  final List<UserEntity> users;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: index == users.length - 1 ? 0 : 10),
        child: AspectRatio(
          aspectRatio: getAspectRatio(),
          child: InkWell(
            onTap: () {
              showSelectedUser(context, index);
            },
            child: CustomUserItem(userEntity: users[index]),
          ),
        ),
      ),
      itemCount: users.length,
    );
  }

  double getAspectRatio() {
    if (width >= 1024) {
      return 16 / 1;
    } else if (width >= 900) {
      return 16 / 1.3;
    } else if (width >= 600) {
      return 16 / 1.7;
    } else if (width >= 560) {
      return 16 / 2;
    } else {
      return 16 / 2.4;
    }
  }

  void showSelectedUser(BuildContext context, int index) {
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
      builder: (_) => SelectedUser(user: users[index]),
    );
  }
}
