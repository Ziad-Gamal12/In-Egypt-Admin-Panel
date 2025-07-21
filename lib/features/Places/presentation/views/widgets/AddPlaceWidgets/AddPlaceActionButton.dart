import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:provider/provider.dart';

class AddPlaceActionButton extends StatelessWidget {
  const AddPlaceActionButton({
    super.key,
    required this.formKey,
    required this.isEdit,
  });
  final GlobalKey<FormState> formKey;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    PlaceEntity place = context.read<PlaceEntity>();
    return Custombutton(
      text: isEdit ? "تعديل" : "اضافة",
      color: isEdit ? Colors.amber : Colors.green,
      textColor: Colors.white,
      onPressed: () {
        if (formKey.currentState != null) {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            if (place.category != '') {
              if (place.images.isNotEmpty) {
                if (isEdit) {
                  place.updatedAt = DateTime.now();
                  context.read<PlacesCubit>().updatePlace(placeEntity: place);
                } else {
                  context.read<PlacesCubit>().addPlace(placeEntity: place);
                }
              } else {
                showWarningSnackBar(
                  context: context,
                  message: "يرجى تحديد صورة المكان",
                );
              }
            } else {
              showWarningSnackBar(
                context: context,
                message: "يرجى تحديد نوع المكان",
              );
            }
          }
        }
      },
    );
  }
}
