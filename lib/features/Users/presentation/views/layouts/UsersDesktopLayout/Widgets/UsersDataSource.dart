import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Usersdatasource extends DataGridSource {
  Usersdatasource({required List<UserEntity> users}) {
    _users = users
        .map<DataGridRow>(
          (e) => DataGridRow(
            cells: [
              DataGridCell<String>(columnName: 'Id', value: e.uid),
              DataGridCell<String>(
                columnName: 'First Name',
                value: e.firstName,
              ),
              DataGridCell<String>(columnName: 'Last Name', value: e.lastName),
              DataGridCell<String>(columnName: 'Email', value: e.email),
              DataGridCell<String>(columnName: 'Role', value: e.role),
              DataGridCell<String>(
                columnName: 'IsBlocked',
                value: e.isBlocked == true ? "محظور" : "غير محظور",
              ),
              DataGridCell<String>(
                columnName: 'IsVerified',
                value: e.isVerified == true ? "مفعل" : "غير مفعل",
              ),
            ],
          ),
        )
        .toList();
  }
  List<DataGridRow> _users = [];
  @override
  List<DataGridRow> get rows => _users;

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
