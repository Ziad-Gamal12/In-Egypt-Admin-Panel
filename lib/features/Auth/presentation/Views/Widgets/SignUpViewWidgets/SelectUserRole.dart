import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/PickUserRoleOptionsEntity.dart';
import 'package:in_egypt_admin_panel/features/Auth/presentation/Views/Widgets/SignUpViewWidgets/CustomSelectUserRoleItem.dart';

class SelectUserRole extends StatefulWidget {
  const SelectUserRole({super.key, required this.roleChanaged});
  final ValueChanged<String?> roleChanaged;
  @override
  State<SelectUserRole> createState() => _SelectUserRoleState();
}

class _SelectUserRoleState extends State<SelectUserRole> {
  int? currentIndex;
  List<PickUserRoleOptionsEntity> options =
      PickUserRoleOptionsEntity.getOptions();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
                widget.roleChanaged(getSelectedRole(index: index));
              },
              child: CustomSelectUserRoleItem(
                isSelected: currentIndex == index,
                e: options[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

String? getSelectedRole({required int? index}) {
  if (index != null) {
    if (index == 0) {
      return Backendkeys.adminRole;
    } else if (index == 1) {
      return Backendkeys.bookingsManagerRole;
    } else if (index == 2) {
      return Backendkeys.placesManagerRole;
    }
  }
  return null;
}
