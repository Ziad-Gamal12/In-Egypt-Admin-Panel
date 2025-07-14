// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.appBartitle});
  final String appBartitle;

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      leadingWidth: 40,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,

      title: Text(
        appBartitle,
        style: AppTextStyles(context).bold19.copyWith(color: Colors.black),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
