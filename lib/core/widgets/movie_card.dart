import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/styles_manger/styles_manager.dart';
import 'package:movies/core/utils/custom_navigation.dart';

import '../../features/details_feature/presentation/pages/details_view.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.image, required this.rate, required this.id,});
final String ?image;
final double? rate ;
final int id;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(onTap: (){context.push( DetailsView(id: id,));},
          child: Container(
            height: MediaQuery.of(context).size.height * .38,
            width: MediaQuery.of(context).size.width * .50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image:  DecorationImage(
                image: NetworkImage(
                 image??"",
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
            top: 10.h,left: 10.w,
            child: Container(padding: const EdgeInsetsDirectional.all(5),
              decoration: BoxDecoration(
                color: Colors.grey.shade600,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    "$rate",
                    style: getRegularStyle(color: Colors.white),
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  )
                ],
              ),
            ))
      ],
    );
  }
}
