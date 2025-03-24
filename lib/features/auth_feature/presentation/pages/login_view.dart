import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/image_manager/image_manager.dart';

import '../../../../../core/services/service_locator.dart';
import '../controller/login_controller/login_cubit.dart';
import '../widgets/login_widgets/login_button_section.dart';
import '../widgets/login_widgets/login_forget_password_section.dart';
import '../widgets/login_widgets/login_view_text_field_section.dart';
import '../widgets/login_widgets/login_switch_register_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<LoginCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageManager.logoImage),
              const SizedBox(height: 20),
              const LoginViewTextFieldSection(),
              SizedBox(height: 10.h),
              const LoginForgetPasswordSection(),
              SizedBox(height: 20.h),
              const LoginButtonSection(),
              SizedBox(height: 10.h),
              const LoginSwitchRegisterSection(),
            ],
          )
        ),
      ),
    );
  }
}
