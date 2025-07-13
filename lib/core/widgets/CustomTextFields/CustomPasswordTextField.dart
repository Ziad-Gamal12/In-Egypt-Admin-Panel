import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomPasswordVisibleIcon.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomTeaxtField.dart';

class CustomPasswordTextField extends StatefulWidget {
  CustomPasswordTextField({super.key, this.controller, this.hintOrlabalText});
  TextEditingController? controller;
  String? hintOrlabalText;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool ispasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Customteaxtfield(
      suffixIcon: Custompasswordvisibleicon(
        visibilityChanged: (isVisible) {
          setState(() {
            ispasswordVisible = isVisible;
          });
        },
      ),
      labelText: widget.hintOrlabalText ?? "كلمة المرور",
      obscureText: !ispasswordVisible,
      controller: widget.controller,
      textInputType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'رجاء إدخال كلمة المرور';
        } else if (value.length < 8) {
          return 'يجب ان تكون كلمة المرور 8 حروف على الاقل';
        }
        return null;
      },
    );
  }
}
