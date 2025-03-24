import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../recourses/color_manager/color_manager.dart';
import '../recourses/styles_manger/styles_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.fontSize,
    this.iconData, this.borderColor,
  });

  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? MediaQuery.of(context).size.height * .06,
      width: width ?? MediaQuery.of(context).size.width * .95,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: borderColor??ColorManager.primary, width: 2),
            borderRadius: BorderRadius.circular(17.r),),
        child: MaterialButton(
          color: backgroundColor ?? ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: getSemiBoldStyle(
              color: foregroundColor ?? ColorManager.black,
              fontSize: fontSize ?? 18,
            ),
          ),
        ),
      ),
    );
  }
}
