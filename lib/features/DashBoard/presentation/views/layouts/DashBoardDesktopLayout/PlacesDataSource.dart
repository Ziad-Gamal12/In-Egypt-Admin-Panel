import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PlacesDataSource extends DataGridSource {
  final List<DataGridRow> _places = [];

  PlacesDataSource({required List<PlaceEntity> places}) {
    updateData(places);
  }

  void updateData(List<PlaceEntity> newData) {
    _places.addAll(
      newData.map<DataGridRow>(
        (e) => DataGridRow(
          cells: [
            DataGridCell<String>(columnName: 'Id', value: e.id),
            DataGridCell<String>(columnName: 'Name', value: e.name),
            DataGridCell<String>(columnName: 'Location', value: e.location),
            DataGridCell<String>(columnName: 'Category', value: e.category),
          ],
        ),
      ),
    );
    notifyListeners(); // Refreshes the grid
  }

  @override
  List<DataGridRow> get rows => _places;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map((cell) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Text(cell.value.toString()),
        );
      }).toList(),
    );
  }
}
