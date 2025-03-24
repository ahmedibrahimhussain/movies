import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/color_manager/color_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import '../controller/on_boarding_cubit.dart';

class OnboardingBackButton extends StatelessWidget {
  const OnboardingBackButton(this.index, {super.key, required this.onTap});

  final int index;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainSemantics: true,
      maintainState: true,
      visible:
          index == (BlocProvider.of<OnBoardingCubit>(context).images.length -5)
              ? false
              : true,
      child: CustomButton(
        text: "Back",foregroundColor: ColorManager.primary,backgroundColor: ColorManager.black,
        height: 50.h,
        onPressed: onTap,
      ),
    );
  }
}
