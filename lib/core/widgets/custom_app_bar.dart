import 'package:flutter/material.dart';
import 'package:movies/core/utils/custom_navigation.dart';

import '../recourses/color_manager/color_manager.dart';
import '../recourses/styles_manger/styles_manager.dart';

AppBar customAppBar({
  required String text,
  required BuildContext context,
}) {
  return AppBar(
    backgroundColor: ColorManager.scaffoldBackGroundColor,
    elevation: 0,
    title:  Text(
      text,
      style: getMediumStyle(fontSize: 18,color: ColorManager.primary),
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
    ),
    leading: IconButton(onPressed: (){context.pop();}, icon: const Icon(Icons.arrow_back,color: ColorManager.primary,))
  );
}
