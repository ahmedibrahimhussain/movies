import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/on_boarding_cubit.dart';
import '../controller/on_boarding_state.dart';

class OnBoardingImageSection extends StatelessWidget {
  const OnBoardingImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final OnBoardingCubit onBoardingCubit =
        BlocProvider.of<OnBoardingCubit>(context);

        return SizedBox(height: MediaQuery.of(context).size.height *.80,
          child: Image.asset(onBoardingCubit.images[onBoardingCubit.index],fit: BoxFit.fill,)
                  
        );
      },
    );



  }
}
