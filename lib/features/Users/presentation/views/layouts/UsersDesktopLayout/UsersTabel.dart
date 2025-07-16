import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/Variables.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardDesktopLayout/CustomGridItemLabel.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/users_table_cubit/users_table_cubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/layouts/UsersDesktopLayout/UsersDataSource.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class UsersTabel extends StatefulWidget {
  const UsersTabel({super.key});

  @override
  State<UsersTabel> createState() => _BookingsTabelState();
}

class _BookingsTabelState extends State<UsersTabel> {
  List<UserEntity> users = <UserEntity>[];

  late Usersdatasource usersdatasource;

  @override
  void initState() {
    super.initState();
    users = Variables.testUsers;
    usersdatasource = Usersdatasource(users: users);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SfDataGrid(
        onCellTap: (details) {
          context.read<UsersTableCubit>().onCellTap(
            userEntity: users[details.rowColumnIndex.rowIndex - 1],
          );
        },
        isScrollbarAlwaysShown: true,
        allowFiltering: true,
        allowSorting: true,
        columnWidthMode: ColumnWidthMode.fill,
        source: usersdatasource,
        columns: <GridColumn>[
          GridColumn(
            columnName: 'Id',
            label: CustomGridItemLabel(label: 'الرقم التعريفي'),
          ),
          GridColumn(
            columnName: 'First Name',
            label: CustomGridItemLabel(label: 'الاسم الاول'),
          ),
          GridColumn(
            columnName: 'Last Name',
            label: CustomGridItemLabel(label: 'الاسم الاخير'),
          ),
          GridColumn(
            columnName: 'Email',
            label: CustomGridItemLabel(label: 'البريد الالكتروني'),
          ),
          GridColumn(
            columnName: 'Role',
            label: CustomGridItemLabel(label: "الصلاحية"),
          ),
          GridColumn(
            columnName: 'IsBlocked',
            label: CustomGridItemLabel(label: "الحظر"),
          ),
          GridColumn(
            columnName: 'IsVerified',
            label: CustomGridItemLabel(label: "التحقق"),
          ),
        ],
      ),
    );
  }
}
