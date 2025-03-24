import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/utils/custom_navigation.dart';
import '../../../../core/widgets/custom_button.dart';
import 'login_view.dart';
import 'register_view.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            CustomButton(
              text: "تسجيل دخول",
              onPressed: () {
                context.push(const LoginView());
              },
            ),
            SizedBox(height: 20.h),
            CustomButton(
              text: "إنشاء حساب",
              onPressed: () {
                context.push(const RegisterView());
              },
              backgroundColor: ColorManager.white,
              foregroundColor: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }
}
