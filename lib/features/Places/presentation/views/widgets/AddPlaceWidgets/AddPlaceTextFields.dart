import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomTeaxtField.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/AddPlaceImageList.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/SelectPlaceCategoryList.dart';
import 'package:provider/provider.dart';

class AddPlaceTextFields extends StatefulWidget {
  const AddPlaceTextFields({super.key, required this.isEdit});
  final bool isEdit;

  @override
  State<AddPlaceTextFields> createState() => _AddPlaceTextFieldsState();
}

class _AddPlaceTextFieldsState extends State<AddPlaceTextFields> {
  TextEditingController? idController;
  TextEditingController? nameController;
  TextEditingController? descriptionController;
  TextEditingController? locationController;
  TextEditingController? latController;
  TextEditingController? longController;
  TextEditingController? priceController;

  @override
  void initState() {
    if (widget.isEdit) {
      PlaceEntity place = context.read<PlaceEntity>();
      idController = TextEditingController(text: place.id);
      nameController = TextEditingController(text: place.name);
      descriptionController = TextEditingController(text: place.description);
      locationController = TextEditingController(text: place.location);
      latController = TextEditingController(text: place.latitude.toString());
      longController = TextEditingController(text: place.longitude.toString());
      priceController = TextEditingController(
        text: place.ticketPrice.toString(),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PlaceEntity place = context.read<PlaceEntity>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customteaxtfield(
          labelText: "الرقم التسلسلي",
          obscureText: false,
          controller: idController,
          textInputType: TextInputType.text,
          onSaved: (val) {
            place.id = val ?? '';
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'الرجاء إدخال الرقم التسلسلي';
            }
            return null;
          },
        ),
        SizedBox(height: 10),
        Customteaxtfield(
          labelText: "اسم المكان",
          obscureText: false,
          controller: nameController,
          textInputType: TextInputType.name,
          onSaved: (val) {
            place.name = val ?? '';
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'الرجاء إدخال اسم المكان';
            }
            return null;
          },
        ),
        SizedBox(height: 10),
        Customteaxtfield(
          labelText: "وصف المكان",
          obscureText: false,
          controller: descriptionController,
          textInputType: TextInputType.name,
          onSaved: (val) {
            place.description = val ?? '';
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'الرجاء إدخال وصف المكان';
            }
            return null;
          },
          maxLines: 3,
        ),
        SizedBox(height: 10),
        Customteaxtfield(
          labelText: "عنوان المكان",
          controller: locationController,
          obscureText: false,
          textInputType: TextInputType.name,
          onSaved: (val) {
            place.location = val ?? '';
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'الرجاء إدخال عنوان المكان';
            }
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
                  controller: latController,
                  obscureText: false,
                  textInputType: TextInputType.number,
                  onSaved: (val) {
                    place.latitude = double.parse(val!);
                  },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'الرجاء إدخال العرض';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Customteaxtfield(
                  labelText: "الطول",
                  controller: longController,
                  obscureText: false,
                  textInputType: TextInputType.number,
                  onSaved: (val) {
                    place.longitude = double.parse(val!);
                  },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'الرجاء إدخال الطول';
                    }
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
          controller: priceController,
          textInputType: TextInputType.number,
          onSaved: (val) {
            place.ticketPrice = double.parse(val!);
          },
          validator: (val) {
            if (val == null || val.isEmpty) {
              return 'الرجاء إدخال سعر التذكرة بالجنيه';
            }
            return null;
          },
        ),
        SizedBox(height: 10),
        SelectPlaceCategoryList(isEdit: widget.isEdit),
        SizedBox(height: 10),
        AddPlaceImageList(),
      ],
    );
  }
}
