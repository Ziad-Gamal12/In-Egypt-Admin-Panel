import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomSearchTextField.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUsersHeader.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUsersSliverList.dart';

class CustomUsersContentBody extends StatelessWidget {
  const CustomUsersContentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomUsersHeader(),
                SizedBox(height: 20),
                CustomSearchTextField(controller: TextEditingController()),
                SizedBox(height: 20),
              ],
            ),
          ),
          CustomUsersSliverList(),
        ],
      ),
    );
  }
}
