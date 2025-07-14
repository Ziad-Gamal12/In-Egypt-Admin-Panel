import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/domain/Entities/PlacesTabelItemEntity.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/CustomGridItemLabel.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/widgets/PlacesDataSource.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PlacesTabel extends StatefulWidget {
  const PlacesTabel({super.key});

  @override
  State<PlacesTabel> createState() => _PlacesTabelState();
}

class _PlacesTabelState extends State<PlacesTabel> {
  List<PlacesTabelItemEntity> places = <PlacesTabelItemEntity>[];

  late PlacesDataSource placesDataSource;

  @override
  void initState() {
    super.initState();
    places = getplaces();
    placesDataSource = PlacesDataSource(places: places);
  }

  List<PlacesTabelItemEntity> getplaces() {
    return [
      PlacesTabelItemEntity(
        id: "123551",
        name: 'أهرامات الجيزة',
        location: "الجيزة",
        category: "تاريخية",
      ),
      PlacesTabelItemEntity(
        id: "123551",
        name: 'أهرامات الجيزة',
        location: "الجيزة",
        category: "تاريخية",
      ),
      PlacesTabelItemEntity(
        id: "123551",
        name: 'أهرامات الجيزة',
        location: "الجيزة",
        category: "تاريخية",
      ),
      PlacesTabelItemEntity(
        id: "123551",
        name: 'أهرامات الجيزة',
        location: "الجيزة",
        category: "تاريخية",
      ),
      PlacesTabelItemEntity(
        id: "123551",
        name: 'أهرامات الجيزة',
        location: "الجيزة",
        category: "تاريخية",
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
