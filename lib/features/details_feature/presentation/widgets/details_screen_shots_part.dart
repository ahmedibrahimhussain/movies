import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/features/details_feature/data/model/details_model.dart';

import '../../../../core/recourses/styles_manger/styles_manager.dart';

class DetailsScreenShotsPart extends StatelessWidget {
  const DetailsScreenShotsPart({super.key, required this.model});
final DetailsModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            "screen Shots",
            style: getSemiBoldStyle(fontSize: 20),
          ),
      SizedBox(height: 20.h),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .20,
        decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            
              image: NetworkImage(
                "${ApiConstants.imageBaseUrl}${model.backdropPath}",
              ),
              fit: BoxFit.fill),
        ),
      ),        ],
      ),
    );
  }
}
