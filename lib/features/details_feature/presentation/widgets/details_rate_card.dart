import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';

class DetailsRateCard extends StatelessWidget {
  const DetailsRateCard({super.key, required this.text, required this.iconData,});
final String text;
final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 25),
      decoration: BoxDecoration(
        color: ColorManager.textFieldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
           iconData,
            color: ColorManager.primary,
            size: 30,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style: getRegularStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
