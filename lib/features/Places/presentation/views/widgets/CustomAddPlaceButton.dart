import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/helpers/getUserData.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddAndEditPlaceWidgets/AddAndEditPlaceBody.dart';

class CustomAddPlaceButton extends StatelessWidget {
  const CustomAddPlaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: canAddPlace(),
      child: InkWell(
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (_) {
              return AddAndEditPlaceBody(place: null, isEdit: false);
            },
          );
        },
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 35,
          child: FittedBox(child: Icon(Icons.add, color: kMainColor)),
        ),
      ),
    );
  }

  bool canAddPlace() {
    if (getUserData().role == Backendkeys.adminRole ||
        getUserData().role == Backendkeys.placesManagerRole) {
      return true;
    } else {
      return false;
    }
  }
}
