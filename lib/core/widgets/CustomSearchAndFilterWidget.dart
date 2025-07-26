import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomSearchTextField.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';

class CustomSearchAndFilterWidget extends StatefulWidget {
  const CustomSearchAndFilterWidget({super.key});

  @override
  State<CustomSearchAndFilterWidget> createState() =>
      _CustomSearchAndFilterWidgetState();
}

class _CustomSearchAndFilterWidgetState
    extends State<CustomSearchAndFilterWidget> {
  TextEditingController controller = TextEditingController();
  Timer? debouncer;
  @override
  void initState() {
    controller.addListener(debounce);
    super.initState();
  }

  debounce() {
    if (debouncer != null && debouncer!.isActive) debouncer!.cancel();
    debouncer = Timer(const Duration(milliseconds: 500), () {
      context.read<PlacesCubit>().searchPlaces(
        searchKey: controller.text.trim().toLowerCase(),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    debouncer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 17,
          child: CustomSearchTextField(controller: controller),
        ),
        SizedBox(width: 20),
        FittedBox(
          child: IconButton(
            iconSize: 30,
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.barsStaggered, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
