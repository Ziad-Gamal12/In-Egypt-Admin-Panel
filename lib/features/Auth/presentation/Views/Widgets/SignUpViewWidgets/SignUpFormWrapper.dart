import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/constant.dart';

class SignUpFormWrapper extends StatelessWidget {
  final Widget child;
  final GlobalKey<FormState> formKey;

  const SignUpFormWrapper({
    super.key,
    required this.child,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizentalPadding,
        vertical: kVerticalPadding,
      ),
      child: Form(key: formKey, child: child),
    );
  }
}
