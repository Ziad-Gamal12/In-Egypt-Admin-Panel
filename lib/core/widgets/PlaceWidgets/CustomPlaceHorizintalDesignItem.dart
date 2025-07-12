import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceHorizintalDesignInfo.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomPlaceImage.dart';

class CustomPlaceHorizintalDesignItem extends StatelessWidget {
  const CustomPlaceHorizintalDesignItem({super.key, required this.isFavourite});
  final bool isFavourite;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 315 / 155,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xffF3F3F3), width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 86,
                child: AspectRatio(
                  aspectRatio: 86 / 116,
                  child: CustomPlaceImage(),
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                flex: 179,
                child: CustomPlaceHorizintalDesignInfo(isFavorite: isFavourite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
