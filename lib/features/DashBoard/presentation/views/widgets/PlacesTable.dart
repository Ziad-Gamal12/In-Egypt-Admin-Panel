import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/Variables.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomGridItemLabel.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/PlacesDataSource.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PlacesTabel extends StatefulWidget {
  const PlacesTabel({super.key});

  @override
  State<PlacesTabel> createState() => _PlacesTabelState();
}

class _PlacesTabelState extends State<PlacesTabel> {
  List<PlaceEntity> places = <PlaceEntity>[];

  late PlacesDataSource placesDataSource;

  @override
  void initState() {
    super.initState();
    places = Variables.testPlacesList;
    placesDataSource = PlacesDataSource(places: places);
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
