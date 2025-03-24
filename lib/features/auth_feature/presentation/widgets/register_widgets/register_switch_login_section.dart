import 'package:flutter/material.dart';
import 'package:movies/core/utils/custom_navigation.dart';

import '../../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../pages/login_view.dart';

class RegisterSwitchLoginSection extends StatelessWidget {
  const RegisterSwitchLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [  Text(
        "Already Have Account ?",
        style: getBoldStyle(
          color: ColorManager.white,
          fontSize: 12,
        ),
      ),
        TextButton(
          onPressed: () {
         context.push(const LoginView());
          },
          child: Text(
            "Login",
            style: getBoldStyle(
              color: ColorManager.primary,
              fontSize: 12,
            ),
          ),
        ),

      ],
    );
  }
}
