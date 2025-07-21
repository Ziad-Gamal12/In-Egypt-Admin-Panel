import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/PlaceDetailsWidgets/PlaceImagesListView.dart';

class PlaceImagesSection extends StatelessWidget {
  const PlaceImagesSection({super.key, required this.imagesURLS});
  final List<String> imagesURLS;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "صور المكان",
          style: AppTextStyles(
            context,
          ).semiBold16.copyWith(color: Colors.black),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .1,
          child: PlaceImagesListView(imagesUrls: imagesURLS),
        ),
      ],
    );
  }
}
