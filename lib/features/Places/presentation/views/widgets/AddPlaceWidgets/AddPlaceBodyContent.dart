import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/core/Entities/imagePickerResult.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_state.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/AddPlaceActionButton.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/AddPlaceHeader.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/AddPlaceTextFields.dart';
import 'package:provider/provider.dart';

class AddPlaceBodyContent extends StatefulWidget {
  const AddPlaceBodyContent({super.key, required this.isEdit});
  final bool isEdit;
  @override
  State<AddPlaceBodyContent> createState() => _AddPlaceBodyContentState();
}

class _AddPlaceBodyContentState extends State<AddPlaceBodyContent> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List placeImages = [
    ImagePickerResult(fileNames: [""]),
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<PlaceEntity>().images.isNotEmpty) {
        placeImages.addAll(context.read<PlaceEntity>().images);
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlacesCubit, PlacesState>(
      listener: (context, state) {
        if (state is PlacesAddPlaceSuccess) {
          showSuccessSnackBar(
            context: context,
            message: "تم اضافة المكان بنجاح",
          );
          Navigator.pop(context);
        } else if (state is PlacesUpdatePlaceSuccess) {
          showSuccessSnackBar(
            context: context,
            message: "تم تعديل المكان بنجاح",
          );
          Navigator.pop(context);
        } else if (state is PlacesUpdatePlaceFailure) {
          showErrorSnackBar(context: context, message: state.errmessage);
        } else if (state is PlacesAddPlaceFailure) {
          showErrorSnackBar(context: context, message: state.errmessage);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: kHorizentalPadding,
              vertical: kVerticalPadding,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border.all(color: Color(0xffF3F3F3), width: 1),
            ),
            child: Form(
              key: formKey,
              child: Provider.value(
                value: placeImages,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddPlaceHeader(isEdit: widget.isEdit),
                    AddPlaceTextFields(isEdit: widget.isEdit),
                    SizedBox(height: 20),
                    state is PlacesAddPlaceLoading ||
                            state is PlacesUpdatePlaceLoading
                        ? Center(
                            child: CircularProgressIndicator(color: kMainColor),
                          )
                        : AddPlaceActionButton(
                            formKey: formKey,
                            isEdit: widget.isEdit,
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
