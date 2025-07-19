import 'package:flutter/material.dart';
import 'package:in_egypt_admin_panel/core/utils/textStyles.dart';

class AboutPlaceSection extends StatelessWidget {
  const AboutPlaceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "تفاصيل المكان",
          style: AppTextStyles(
            context,
          ).semiBold16.copyWith(color: Colors.black),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: Text(
            "الأهرامات المصرية هي هياكل حجرية قديمة تقع في مصر. تم بناء معظمها كمقابر لـ الفراعنة وزوجاتهم خلال قديم و المملكة الوسطى فترات.[1][2][3] تم التعرف على ما لا يقل عن 138 الأهرامات تم اكتشافها في مصر.[4][5] تقريبًا 80 هرمًا تم بناؤها داخل مملكة كوش، تقع الآن في دولة حديثة السودان.",
            style: AppTextStyles(
              context,
            ).regular11.copyWith(color: Colors.grey),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
