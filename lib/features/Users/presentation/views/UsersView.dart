import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/UsersViewBody.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});
  static const routeName = '/users';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: UsersViewBody());
  }
}
