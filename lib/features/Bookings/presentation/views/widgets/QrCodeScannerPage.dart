import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/services/get_it_Service.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomAppBar.dart';
import 'package:in_egypt_admin_panel/features/Bookings/domain/Repos/BookingsRepo.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/filter_bookings_cubit/filter_bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/QRScannerPageBody.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});
  static const routeName = '/QRScannerPage';
  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  late MobileScannerController scannerController;

  @override
  void initState() {
    super.initState();

    scannerController = MobileScannerController(
      cameraResolution: const Size(640, 480),
      detectionSpeed: DetectionSpeed.noDuplicates,
      detectionTimeoutMs: 250,
      formats: [BarcodeFormat.qrCode],
      returnImage: false,
      torchEnabled: false,
      invertImage: false,
      autoZoom: true,
    );
  }

  @override
  void dispose() {
    scannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FilterBookingsCubit(bookingsRepo: getIt<BookingsRepo>()),
      child: Scaffold(
        appBar: CustomAppBar(appBartitle: "مسح الكود"),
        body: QRScannerPageBody(scannerController: scannerController),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            scannerController.toggleTorch();
          },
          child: const Icon(Icons.flash_on),
        ),
      ),
    );
  }
}
