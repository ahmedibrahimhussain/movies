import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/browse_feature/data/models/movies_category_model.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../controller/movies_category_controller/movies_category_cubit.dart';

class MoviesCategoryCard extends StatelessWidget {
  const MoviesCategoryCard({super.key, required this.genres});
  final Genres genres;
  @override
  Widget build(BuildContext context) {
    final bool checkIfChosen =
        BlocProvider.of<MoviesCategoryCubit>(context).genres.id == genres.id;

    return GestureDetector(
      onTap: () {
        BlocProvider.of<MoviesCategoryCubit>(context).chooseCategory(genres,context);
      },
      child: Container(
        margin: const EdgeInsetsDirectional.all(5),
        padding: EdgeInsetsDirectional.all(5.sp),
        decoration: BoxDecoration(
          color: checkIfChosen ? ColorManager.primary : ColorManager.scaffoldBackGroundColor,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            width: 2,
            color: ColorManager.primary,
          ),
        ),
        child: Text(
          genres.name,
          style: getSemiBoldStyle(
            fontSize: 20,
            color: checkIfChosen ? ColorManager.black : ColorManager.white,
          ),
        ),
      ),
    );
  }
}
