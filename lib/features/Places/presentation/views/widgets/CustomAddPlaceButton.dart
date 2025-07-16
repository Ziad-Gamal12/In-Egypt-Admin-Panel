import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';

class CustomAddPlaceButton extends StatelessWidget {
  const CustomAddPlaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black,
      radius: 30,
      child: FittedBox(child: Icon(Icons.add, color: kMainColor)),
    );
  }
}
