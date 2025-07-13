import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/DashBaordViewBody.dart';

class DashBaordView extends StatelessWidget {
  const DashBaordView({super.key});
  static const routeName = '/DashBaordView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const DashBaordViewBody());
  }
}
