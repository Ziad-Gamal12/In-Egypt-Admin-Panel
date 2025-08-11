import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/core/helpers/getUserData.dart';
import 'package:in_egypt_admin_panel/core/utils/BackEndkeys.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomButton.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';

class AddAndEditPlaceActionButton extends StatelessWidget {
  const AddAndEditPlaceActionButton({
    super.key,
    required this.formKey,
    required this.isEdit,
  });
  final GlobalKey<FormState> formKey;
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    PlaceEntity place = context.read<PlaceEntity>();
    List images = context.read<List>();
    return BlocBuilder<PlacesCubit, PlacesState>(
      builder: (context, state) {
        if (state is PlacesUpdatePlaceLoading ||
            state is PlacesAddPlaceLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: isEdit ? Colors.amber : Colors.green,
            ),
          );
        }
        return Visibility(
          visible: canAddorEditPlace(),
          child: Custombutton(
            text: isEdit ? "تعديل" : "اضافة",
            color: isEdit ? Colors.amber : Colors.green,
            textColor: Colors.white,
            onPressed: () {
              try {
                if (formKey.currentState != null) {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (place.category != '') {
                      if (images.isNotEmpty) {
                        if (isEdit) {
                          place.updatedAt = DateTime.now();
                          context.read<PlacesCubit>().updatePlace(
                            placeEntity: place,
                            images: images,
                          );
                        } else {
                          context.read<PlacesCubit>().addPlace(
                            placeEntity: place,
                            images: images,
                          );
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
              } on Exception catch (e) {
                showWarningSnackBar(context: context, message: e.toString());
              }
            },
          ),
        );
      },
    );
  }

  bool canAddorEditPlace() {
    if (getUserData().role == Backendkeys.adminRole ||
        getUserData().role == Backendkeys.placesManagerRole) {
      return true;
    } else {
      return false;
    }
  }
}
