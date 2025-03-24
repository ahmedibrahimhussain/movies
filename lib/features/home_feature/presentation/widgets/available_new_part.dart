import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/image_manager/image_manager.dart';
import 'available_new_slider_part.dart';

class AvailableNewPart extends StatelessWidget {
  const AvailableNewPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0.5, 1],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              ImageManager.onBoarding2Image,
              fit: BoxFit.fill,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .70,
            )),
        Positioned(
          top: 10.h,
          left: MediaQuery.of(context).size.width * .25,
          child: Image.asset(ImageManager.availableImage),
        ),
        Positioned(
          bottom: 10.h,
          left: MediaQuery.of(context).size.width * .13,
          child: Image.asset(ImageManager.watchNewImage),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.width * .45,
          child: const AvailableNewSliderPart(),
        ),
      ],
    );
  }
}
