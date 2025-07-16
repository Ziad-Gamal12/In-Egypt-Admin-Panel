import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomSearchTextField.dart';

class UsersViewHeaderDesktopLayout extends StatelessWidget {
  const UsersViewHeaderDesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "المستخدمين",
        style: AppTextStyles(context).semiBold24.copyWith(color: Colors.black),
      ),
      subtitle: Text(
        "1204 مستخدم",
        style: AppTextStyles(context).regular10.copyWith(color: Colors.black),
      ),
      trailing: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: CustomSearchTextField(controller: TextEditingController()),
      ),
    );
  }
}
