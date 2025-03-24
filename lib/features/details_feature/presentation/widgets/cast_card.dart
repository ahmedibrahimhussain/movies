import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/features/details_feature/data/model/cast_model.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';

class CastCard extends StatelessWidget {
  const CastCard({super.key, required this.cast});
final Cast cast;
  @override
  Widget build(BuildContext context) {
    return  Container(padding: const EdgeInsetsDirectional.all(10),
      decoration: BoxDecoration(
        color: ColorManager.textFieldColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                    "${ApiConstants.imageBaseUrl}${cast.profilePath}",
                  ),
                  fit: BoxFit.fill,),
            ),

          ),SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name : ${cast.name}",
                  style: getRegularStyle(),
                ),
                Text(
                  '''Character :${cast.character}''',
                  style: getRegularStyle(),
                  maxLines: 3,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
