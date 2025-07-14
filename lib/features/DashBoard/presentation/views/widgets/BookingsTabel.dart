import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/Variables.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/BookingsDataSource.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomGridItemLabel.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BookingsTabel extends StatefulWidget {
  const BookingsTabel({super.key});

  @override
  State<BookingsTabel> createState() => _BookingsTabelState();
}

class _BookingsTabelState extends State<BookingsTabel> {
  List<BookingEntity> bookings = <BookingEntity>[];

  late Bookingsdatasource placesDataSource;

  @override
  void initState() {
    super.initState();
    bookings = Variables.testBookingsList;
    placesDataSource = Bookingsdatasource(bookings: bookings);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SfDataGrid(
        columnWidthMode: ColumnWidthMode.fill,
        source: placesDataSource,
        columns: <GridColumn>[
          GridColumn(
            columnName: 'Id',
            label: CustomGridItemLabel(label: 'الرقم التعريفي'),
          ),
          GridColumn(
            columnName: 'Name',
            label: CustomGridItemLabel(label: 'الاسم'),
          ),
          GridColumn(
            columnName: 'Location',
            label: CustomGridItemLabel(label: 'الموقع'),
          ),
          GridColumn(
            columnName: 'Duration',
            label: CustomGridItemLabel(label: 'المدة'),
          ),
        ],
      ),
    );
  }
}
