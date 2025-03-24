import 'package:flutter/material.dart';
import 'package:movies/core/utils/custom_navigation.dart';

import '../../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../pages/forget_password_view.dart';

class LoginForgetPasswordSection extends StatelessWidget {
  const LoginForgetPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            context.push(const ForgetPasswordView());
          },
          child: Text(
            'Forget Password ?',
            style: getSemiBoldStyle(
              color: ColorManager.primary,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
