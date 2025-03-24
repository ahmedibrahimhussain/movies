import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/color_manager/color_manager.dart';
import 'package:movies/core/utils/custom_navigation.dart';
import 'package:movies/core/widgets/custom_button.dart';
import 'package:movies/features/auth_feature/presentation/pages/login_view.dart';

import '../pages/update_profile_view.dart';

class ProfileButtonsPart extends StatelessWidget {
  const ProfileButtonsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CustomButton(
              text: "Edit Profile",
              onPressed: () {context.push(const UpdateProfileView());},
            ),
          ),SizedBox(width: 10.w),
          Expanded(
            flex: 1,
            child: CustomButton(
              text: "EXIT",
              onPressed: () {context.pushReplacement(const LoginView());},
              foregroundColor: ColorManager.white,
              backgroundColor: ColorManager.secondaryColor,
              borderColor: ColorManager.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
