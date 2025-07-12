import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/Features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomTextFields/CustomTeaxtField.dart';

class SignUpNameFields extends StatelessWidget {
  const SignUpNameFields({super.key});

  @override
  Widget build(BuildContext context) {
    UserEntity userEntity = context.read<UserEntity>();
    return Column(
      children: [
        Customteaxtfield(
          labelText: "الأسم الأول",
          obscureText: false,
          textInputType: TextInputType.name,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (val) {
            userEntity.firstName = val ?? '';
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال الاسم الأول';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        Customteaxtfield(
          labelText: "الأسم الأخير",
          obscureText: false,
          textInputType: TextInputType.name,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (val) {
            userEntity.lastName = val ?? '';
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'الرجاء إدخال الاسم الأخير';
            }
            return null;
          },
        ),
      ],
    );
  }
}
