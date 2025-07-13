import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/ManagePlacesViewBody.dart';

class ManagePlacesView extends StatelessWidget {
  const ManagePlacesView({super.key});
  static const routeName = '/ManagePlacesView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const ManagePlacesViewBody());
  }
}
