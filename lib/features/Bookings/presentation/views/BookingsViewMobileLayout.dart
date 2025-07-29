import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawer.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Repos/BookingsRepo.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/bookings_cubit/bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/BookingsViewBody.dart';

class BookingsViewMobileLayout extends StatefulWidget {
  const BookingsViewMobileLayout({super.key});
  @override
  State<BookingsViewMobileLayout> createState() =>
      _BookingsViewMobileLayoutState();
}

class _BookingsViewMobileLayoutState extends State<BookingsViewMobileLayout> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookingsCubit(bookingsRepo: getIt.get<BookingsRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(appBartitle: "الحجوزات"),
        drawer: CustomDrawer(currentIndex: currentIndex),
        body: BookingsViewBody(),
      ),
    );
  }
}
