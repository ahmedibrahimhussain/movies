import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/model/details_model.dart';
import 'details_rate_card.dart';

class DetailsButtonPart extends StatelessWidget {
  const DetailsButtonPart({super.key, required this.model});
 final DetailsModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: "Watch",
          onPressed: () {},
          foregroundColor: ColorManager.white,
          backgroundColor: ColorManager.secondaryColor,
          borderColor: ColorManager.secondaryColor,
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            DetailsRateCard(text: "${model.runtime}", iconData: Icons.watch_later),
            DetailsRateCard(text: "${model.voteAverage?.toStringAsFixed(1)}", iconData: Icons.star),
          ],
        ),
        SizedBox(height: 10.h),
        DetailsRateCard(text: "${model.revenue}", iconData: Icons.favorite),
      ],
    );
  }
}
