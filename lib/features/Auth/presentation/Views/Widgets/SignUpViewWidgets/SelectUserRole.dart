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
  @override
  Widget build(BuildContext context) {
    return Row(
      children: PickUserRoleOptionsEntity.getOptions()
          .asMap()
          .entries
          .map<Widget>((e) {
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = e.key;
                  });
                  widget.roleChanaged(getSelectedRole(index: e.key));
                },
                child: CustomSelectUserRoleItem(
                  isSelected: e.key == currentIndex,
                  e: e.value,
                ),
              ),
            );
          })
          .toList(),
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
