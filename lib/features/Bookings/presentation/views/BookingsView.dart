import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingsViewBody.dart';

class BookingsView extends StatelessWidget {
  const BookingsView({super.key});
  static const routeName = '/Bookings';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const BookingsViewBody());
  }
}
