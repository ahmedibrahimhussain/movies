import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/image_manager/image_manager.dart';
import 'package:movies/core/widgets/custom_app_bar.dart';

import '../../../../../core/services/service_locator.dart';
import '../controller/register_controller/register_cubit.dart';
import '../widgets/register_widgets/register_button_section.dart';
import '../widgets/register_widgets/register_switch_login_section.dart';
import '../widgets/register_widgets/register_text_field_section.dart';


class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl.get<RegisterCubit>()),
      ],
      child: Scaffold(appBar: customAppBar(text: "Register", context: context),
        body: SafeArea(
          child:  SingleChildScrollView( physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Image.asset(ImageManager.registerImage),
                SizedBox(height: 20.h),
                const RegisterTextFieldSection(),
                SizedBox(height: 30.h),
                const RegisterButtonSection(),
                SizedBox(height: 10.h),
                const RegisterSwitchLoginSection(),
              ],
            ),
          )
        ),
      ),
    );
  }
}
