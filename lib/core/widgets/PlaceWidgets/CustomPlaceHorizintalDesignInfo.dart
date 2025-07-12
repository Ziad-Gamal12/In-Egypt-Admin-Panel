import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomFavouritePlaceWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/PlaceWidgets/CustomRatingStarsRow.dart';

class CustomPlaceHorizintalDesignInfo extends StatelessWidget {
  const CustomPlaceHorizintalDesignInfo({super.key, required this.isFavorite});
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "أهرامات الجيزة",
              style: AppTextStyles(
                context,
              ).semiBold16.copyWith(color: Colors.black),
            ),
            Spacer(),
            CustomFavouritePlaceWidget(isFavourite: isFavorite),
          ],
        ),
        SizedBox(height: 10),
        Text(
          "\$245,00",
          style: AppTextStyles(context).semiBold14.copyWith(color: Colors.red),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomRatingStarsRow(),
            SizedBox(width: 5),
            Text(
              "4.8",
              style: AppTextStyles(
                context,
              ).semiBold12.copyWith(color: Colors.black),
            ),
          ],
        ),
        SizedBox(height: 5),
        Expanded(
          child: SizedBox(
            child: Text(
              "الأهرامات المصرية هي هياكل حجرية قديمة تقع في مصر. تم بناء معظمها كمقابر لـ الفراعنة وزوجاتهم خلال قديم و المملكة الوسطى فترات.[1][2][3] تم التعرف على ما لا يقل عن 138 الأهرامات تم اكتشافها في مصر.[4][5] تقريبًا 80 هرمًا تم بناؤها داخل مملكة كوش، تقع الآن في دولة حديثة السودان.",
              style: AppTextStyles(
                context,
              ).regular13.copyWith(color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
