import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../controller/on_boarding_cubit.dart';
import 'on_boarding_indicator_section.dart';

class OnBoardingSkipSection extends StatelessWidget {
  const OnBoardingSkipSection(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainSemantics: true,
          maintainState: true,
          visible: index ==
                  (BlocProvider.of<OnBoardingCubit>(context).images.length - 1)
              ? false
              : true,
          child: TextButton(
            onPressed: () async {
           //   context.push(const LoginView());

            },
            child: Text(
              'تخطي',
              style: getRegularStyle(
                color: ColorManager.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
        const OnBoardingIndicatorSection()
      ],
    );
  }
}
