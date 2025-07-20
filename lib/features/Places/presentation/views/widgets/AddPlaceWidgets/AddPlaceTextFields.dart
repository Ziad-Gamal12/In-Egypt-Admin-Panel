import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomTeaxtField.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/AddPlaceImageList.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/SelectPlaceCategoryList.dart';

class AddPlaceTextFields extends StatelessWidget {
  const AddPlaceTextFields({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customteaxtfield(
          labelText: "الرقم التسلسلي",
          obscureText: false,
          textInputType: TextInputType.text,
          validator: (val) {
            return null;
          },
        ),
        SizedBox(height: 10),
        Customteaxtfield(
          labelText: "اسم المكان",
          obscureText: false,
          textInputType: TextInputType.name,
          validator: (val) {
            return null;
          },
        ),
        SizedBox(height: 10),
        Customteaxtfield(
          labelText: "وصف المكان",
          obscureText: false,
          textInputType: TextInputType.name,
          validator: (val) {
            return null;
          },
          maxLines: 3,
        ),
        SizedBox(height: 10),
        Customteaxtfield(
          labelText: "عنوان المكان",
          obscureText: false,
          textInputType: TextInputType.name,
          validator: (val) {
            return null;
          },
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: Customteaxtfield(
                  labelText: "العرض",
                  obscureText: false,
                  textInputType: TextInputType.name,
                  validator: (val) {
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Customteaxtfield(
                  labelText: "الطول",
                  obscureText: false,
                  textInputType: TextInputType.name,
                  validator: (val) {
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Customteaxtfield(
          labelText: "سعر التذكرة بالجنيه",
          obscureText: false,
          textInputType: TextInputType.number,
          validator: (val) {
            return null;
          },
        ),
        SizedBox(height: 10),
        SelectPlaceCategoryList(),
        SizedBox(height: 10),
        AddPlaceImageList(),
      ],
    );
  }
}
