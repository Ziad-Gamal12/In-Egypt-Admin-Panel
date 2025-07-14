import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/PlacesTabelItemEntity.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PlacesDataSource extends DataGridSource {
  PlacesDataSource({required List<PlacesTabelItemEntity> places}) {
    _places = places
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'Id', value: e.id),
              DataGridCell<String>(columnName: 'Name', value: e.name),
              DataGridCell<String>(columnName: 'Location', value: e.location),
              DataGridCell<String>(columnName: 'Category', value: e.category),
            ],
          ),
        )
        .toList();
  }
  List<DataGridRow> _places = [];
  @override
  List<DataGridRow> get rows => _places;

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
          child: Text(dataGridCell.value.toString()),
        );
      }).toList(),
    );
  }
}
