import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/utils/Variables.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardDesktopLayout/CustomGridItemLabel.dart';
import 'package:in_egypt_admin_panel/features/DashBoard/presentation/views/layouts/DashBoardDesktopLayout/PlacesDataSource.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PlacesTabel extends StatefulWidget {
  const PlacesTabel({super.key});
  @override
  State<PlacesTabel> createState() => _PlacesTabelState();
}

class _PlacesTabelState extends State<PlacesTabel> {
  List<PlaceEntity> allPlaces = Variables.testPlacesList;
  List<PlaceEntity> currentPageData = [];
  late PlacesDataSource placesDataSource;

  final int rowsPerPage = 10;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() {
    final start = currentPage * rowsPerPage;
    final end = start + rowsPerPage;
    final nextBatch = allPlaces.skip(start).take(rowsPerPage).toList();
    if (currentPage == 0) {
      placesDataSource = PlacesDataSource(places: nextBatch);
    } else {
      placesDataSource.updateData(nextBatch);
    }

    currentPage++;
    setState(() {});
  }

  bool get hasMorePages => (currentPage * rowsPerPage) < allPlaces.length;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
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
        ),
        if (hasMorePages)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ElevatedButton(
              onPressed: loadNextPage,
              child: Text('تحميل المزيد'),
            ),
          ),
      ],
    );
  }
}
