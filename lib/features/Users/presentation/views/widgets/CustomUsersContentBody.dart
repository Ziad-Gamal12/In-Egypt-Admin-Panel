import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomSearchTextField.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUsersMobileAndTabletSliverList.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUsersMolbieAndTabletHeader.dart';

class CustomUsersContentBody extends StatelessWidget {
  const CustomUsersContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomUsersMolbieAndTabletHeader(),
              SizedBox(height: 20),
              CustomSearchTextField(controller: TextEditingController()),
              SizedBox(height: 20),
            ],
          ),
        ),
        CustomUsersMobileAndTabletSliverList(),
      ],
    );
  }
}
