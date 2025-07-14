import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/BookingsTabelItemEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/BookingsDataSource.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomGridItemLabel.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class BookingsTabel extends StatefulWidget {
  const BookingsTabel({super.key});

  @override
  State<BookingsTabel> createState() => _BookingsTabelState();
}

class _BookingsTabelState extends State<BookingsTabel> {
  List<BookingsTabelItemEntity> bookings = <BookingsTabelItemEntity>[];

  late Bookingsdatasource placesDataSource;

  @override
  void initState() {
    super.initState();
    bookings = getBookings();
    placesDataSource = Bookingsdatasource(bookings: bookings);
  }

  List<BookingsTabelItemEntity> getBookings() {
    return [
      BookingsTabelItemEntity(
        id: "123551",
        userName: "محمد صلاح",
        date: "2023-01-01",
        duration: "2يوم",
      ),
      BookingsTabelItemEntity(
        id: "123551",
        userName: "محمد صلاح",
        date: "2023-01-01",
        duration: "2يوم",
      ),
      BookingsTabelItemEntity(
        id: "123551",
        userName: "محمد صلاح",
        date: "2023-01-01",
        duration: "2يوم",
      ),
      BookingsTabelItemEntity(
        id: "123551",
        userName: "محمد صلاح",
        date: "2023-01-01",
        duration: "2يوم",
      ),
      BookingsTabelItemEntity(
        id: "123551",
        userName: "محمد صلاح",
        date: "2023-01-01",
        duration: "2يوم",
      ),
    ];
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
            columnName: 'Category',
            label: CustomGridItemLabel(label: 'التصنيف'),
          ),
        ],
      ),
    );
  }
}
