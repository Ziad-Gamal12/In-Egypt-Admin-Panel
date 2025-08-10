import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomSearchTextField.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUsersHeaderInfo.dart';

class CustomUsersHeader extends StatefulWidget {
  const CustomUsersHeader({super.key});
  @override
  State<CustomUsersHeader> createState() => _CustomUsersHeaderState();
}

class _CustomUsersHeaderState extends State<CustomUsersHeader> {
  late TextEditingController searchController;
  Timer? _debounce;
  @override
  void initState() {
    searchController = TextEditingController();
    searchController.addListener(debounce);
    super.initState();
  }

  void debounce() {
    if (_debounce != null && _debounce!.isActive) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<UsersCubit>().getSearchedUsers(
        searchKey: searchController.text.toLowerCase(),
      );
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomUsersHeaderInfo(),
        Spacer(),
        Expanded(child: CustomSearchTextField(controller: searchController)),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.ban, color: Colors.red),
        ),
      ],
    );
  }
}
