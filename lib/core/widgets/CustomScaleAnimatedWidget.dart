import 'package:flutter/material.dart';

class CustomScaleAnimatedWidget extends StatefulWidget {
  const CustomScaleAnimatedWidget({super.key, required this.child});
  final Widget child;
  @override
  State<CustomScaleAnimatedWidget> createState() =>
      _CustomScaleAnimatedWidgetState();
}

class _CustomScaleAnimatedWidgetState extends State<CustomScaleAnimatedWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.08 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: widget.child,
      ),
    );
  }
}
