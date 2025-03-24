import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/service_locator.dart';
import '../controller/on_boarding_cubit.dart';
import '../controller/on_boarding_state.dart';
import '../widgets/on_boarding_image_section.dart';
import '../widgets/on_boarding_text_part.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<OnBoardingCubit>(),
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          BlocProvider.of<OnBoardingCubit>(context);

          return   Scaffold(
            body: Stack(alignment:Alignment.topCenter,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height ,),
                const OnBoardingImageSection(),
                const Positioned(bottom:0,child: OnBoardingTextPart())
              ],
            ),
          );
        },
      ),
    );
  }
}
