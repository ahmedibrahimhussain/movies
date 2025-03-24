import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../controller/on_boarding_cubit.dart';

class OnBoardingIndicatorSection extends StatelessWidget {
  const OnBoardingIndicatorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingCubit onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmoothPageIndicator(
          controller: onBoardingCubit.pageController,
          count: onBoardingCubit.images.length,
          effect: ExpandingDotsEffect(
            activeDotColor: ColorManager.black,
            dotColor: ColorManager.white,expansionFactor: 4,spacing: 5,
            dotHeight: 6.h,
            dotWidth: 10.w,
          ),
        ),
      ],
    );
  }
}
