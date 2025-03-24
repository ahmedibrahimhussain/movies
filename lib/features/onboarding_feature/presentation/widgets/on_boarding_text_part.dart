import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/utils/custom_navigation.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/features/auth_feature/presentation/pages/login_view.dart';
import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../controller/on_boarding_cubit.dart';
import '../controller/on_boarding_state.dart';
import 'on_boarding_button.dart';

class OnBoardingTextPart extends StatelessWidget {
  const OnBoardingTextPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final OnBoardingCubit onBoardingCubit =
            BlocProvider.of<OnBoardingCubit>(context);

        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorManager.black,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.r),
            ),
          ),
          padding: const EdgeInsetsDirectional.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                onBoardingCubit.data[onBoardingCubit.index].title,
                style: getBoldStyle(
                  fontSize: 22,
                  color: ColorManager.white,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                onBoardingCubit.data[onBoardingCubit.index].supTitle,
                style: getRegularStyle(
                  color: ColorManager.white,
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                  text: "Next",
                  onPressed: () {
                    onBoardingCubit.index >= onBoardingCubit.data.length-1
                        ? context.push(const LoginView())
                        : onBoardingCubit
                            .onPageChanged(onBoardingCubit.index + 1);
                  }),
              SizedBox(height: 10.h),
              OnboardingBackButton(
                onBoardingCubit.index,
                onTap: () {
                  onBoardingCubit.onPageChanged(onBoardingCubit.index - 1);
                },
              )
            ],
          ),
        );
      },
    );
  }
}
