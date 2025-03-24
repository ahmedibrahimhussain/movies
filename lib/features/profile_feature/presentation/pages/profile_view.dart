import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/color_manager/color_manager.dart';
import 'package:movies/features/profile_feature/presentation/widgets/profile_buttons_part.dart';
import 'package:movies/features/profile_feature/presentation/widgets/profile_grade_view.dart';
import 'package:movies/features/profile_feature/presentation/widgets/profile_info_row.dart';
import 'package:movies/features/profile_feature/presentation/widgets/profile_toggle_row.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: ColorManager.textFieldColor,
                child: const Column(
                  children: [
                    ProfileInfoRow(),
                    ProfileButtonsPart(),
                    FavoritesRow(),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              const ProfileGradeView(),
            ],
          ),
        ),
      ),
    );
  }
}
