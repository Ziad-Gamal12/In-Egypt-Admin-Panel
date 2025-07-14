import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:in_egypt_admin_panel/core/Entities/CustomDrawerItemEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/Drawer/CustomDrawerItem.dart';

class CustomDrawerContentActionsItems extends StatefulWidget {
  CustomDrawerContentActionsItems({
    super.key,
    required this.currentIndexChanged,
    required this.currentIndex,
  });
  int currentIndex;
  final ValueChanged<int> currentIndexChanged;

  @override
  State<CustomDrawerContentActionsItems> createState() =>
      _CustomDrawerContentActionsItemsState();
}

class _CustomDrawerContentActionsItemsState
    extends State<CustomDrawerContentActionsItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: CustomDrawerItemEntity.toList()
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () {
                  setState(() {
                    widget.currentIndex = e.key;
                  });
                  widget.currentIndexChanged(widget.currentIndex);
                },
                child:
                    CustomDrawerItem(
                          drawerItemEntity: e.value,
                          isActive: e.key == widget.currentIndex,
                        )
                        .animate(delay: Duration(milliseconds: e.key * 200))
                        .moveX(begin: -30, duration: 500.ms)
                        .fadeIn(duration: 500.ms),
              ),
            ),
          )
          .toList(),
    );
  }
}
