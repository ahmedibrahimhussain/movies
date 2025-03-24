import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/color_manager/color_manager.dart';
import 'package:movies/core/recourses/image_manager/image_manager.dart';
import 'package:movies/core/widgets/custom_app_bar.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/core/widgets/custom_text_field.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "Pick Avatar", context: context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 40.h),
          Image.asset(
            ImageManager.avatar1,
          ),
          SizedBox(height: 20.h),
          const CustomTextFormField(
            hintText: "Name",
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20.h),
          const CustomTextFormField(
            hintText: "Phone ",
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          CustomButton(
            text: "Delete Account",
            onPressed: () {},
            borderColor: ColorManager.secondaryColor,
            foregroundColor: ColorManager.white,
            backgroundColor: ColorManager.secondaryColor,
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: "Update Data",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
