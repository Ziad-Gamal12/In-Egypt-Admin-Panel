import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Bookingsdatasource extends DataGridSource {
  Bookingsdatasource({required List<BookingEntity> bookings}) {
    _bookings = bookings
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'Id', value: e.id),
              DataGridCell<String>(
                columnName: 'User Name',
                value: e.user.firstName,
              ),
              DataGridCell<String>(
                columnName: 'Date',
                value: "${e.startAt.day}/${e.startAt.month}/${e.startAt.year}",
              ),
              DataGridCell<double>(
                columnName: 'Duration',
                value: e.daysDuration,
              ),
            ],
          ),
        )
        .toList();
  }
  List<DataGridRow> _bookings = [];
  @override
  List<DataGridRow> get rows => _bookings;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          alignment:
              (dataGridCell.columnName == 'Id' ||
                  dataGridCell.columnName == 'Name')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              dataGridCell.value.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }).toList(),
    );
  }
}
