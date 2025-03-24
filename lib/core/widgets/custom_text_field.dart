import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../recourses/styles_manger/styles_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.controller,
    this.validator,
    this.obscureText,
    this.maxLine,
    this.height,
    this.onChanged,
  });

  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Future<void> Function(String?)? onChanged;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? maxLine;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: height ?? 60,
        child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          maxLines: maxLine ?? 1,
          validator: validator,
          obscureText: obscureText ?? false,
          keyboardType: textInputType,style: getRegularStyle(),
          decoration: InputDecoration(
            fillColor: ColorManager.textFieldColor,
            filled: true,
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.textFieldColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: ColorManager.textFieldColor),
                borderRadius: BorderRadius.circular(10)),
            errorBorder:OutlineInputBorder(
                borderSide:
                const BorderSide(color: ColorManager.textFieldColor),
                borderRadius: BorderRadius.circular(10)) ,
            hintStyle: getRegularStyle(
              color: ColorManager.white,
            ),
            labelStyle: getRegularStyle(
              color: ColorManager.primary,
            ),
          ),
        ),
      ),
    );
  }
}
