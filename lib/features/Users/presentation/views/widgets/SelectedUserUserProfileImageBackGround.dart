import 'package:flutter/material.dart';

class SelectedUserUserProfileImageBackGround extends StatelessWidget {
  const SelectedUserUserProfileImageBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.yellow.shade100,
      ),
    );
  }
}
