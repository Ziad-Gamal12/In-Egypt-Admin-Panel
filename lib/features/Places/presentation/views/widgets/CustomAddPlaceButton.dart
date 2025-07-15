import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_egypt_admin_panel/constant.dart';

class CustomAddPlaceButton extends StatelessWidget {
  const CustomAddPlaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      child: Icon(FontAwesomeIcons.cloudArrowUp, color: kMainColor),
    );
  }
}
