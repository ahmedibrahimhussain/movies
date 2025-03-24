import 'package:flutter/material.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/features/details_feature/presentation/widgets/add_to_favorites_part.dart';

import '../../../../core/recourses/image_manager/image_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../data/model/details_model.dart';

class DetailsPlayPart extends StatelessWidget {
  const DetailsPlayPart({super.key, required this.model});
 final DetailsModel model;
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
                stops: [0.9, 1],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.network(
              "${ApiConstants.imageBaseUrl}${model.posterPath}",
              fit: BoxFit.fill,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .75,
            )),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .10,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 60,
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .90,
              child: Text(
                '''${model.title}''',
                style: getSemiBoldStyle(fontSize: 25),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .03,
          left: MediaQuery.of(context).size.width * .35,
          child: Text(
            model.releaseDate!,
            style: getRegularStyle(fontSize: 20),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .25,
          left: MediaQuery.of(context).size.width * .40,
          child: Image.asset(ImageManager.playImage),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .05,
          left: MediaQuery.of(context).size.width *.85,
          child:  AddToFavoritesPart(model: model,),
        ),
      ],
    );  }
}
