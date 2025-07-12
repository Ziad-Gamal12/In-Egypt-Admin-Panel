import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/images.dart';
import 'package:lottie/lottie.dart';

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
                Positioned.fill(
                  child: Container(color: Colors.yellowAccent.shade100),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .60,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: LottieBuilder.asset(
                      Assets.assetsLottieCamelWalk,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          )
        : child;
  }
}
