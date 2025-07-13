import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
    required this.child,
    required this.isloading,
  });
  final Widget child;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return isloading
        ? IgnorePointer(
            ignoring: true,
            child: Stack(
              alignment: Alignment.center,
              children: [
                child,
                Positioned.fill(child: Container(color: Colors.amberAccent)),
                Positioned(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    size: getIndicatorSize(context: context),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        : child;
  }

  double getIndicatorSize({required BuildContext context}) {
    switch (MediaQuery.of(context).size.width) {
      case 600:
        return 50;
      case 900:
        return 100;
      default:
        return 150;
    }
  }
}
