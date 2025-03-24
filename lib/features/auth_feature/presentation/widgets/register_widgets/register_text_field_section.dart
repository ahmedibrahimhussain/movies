import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../controller/register_controller/register_cubit.dart';
import '../../controller/register_controller/register_state.dart';

class RegisterTextFieldSection extends StatelessWidget {
  const RegisterTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);

    return Form(
      key: cubit.key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            controller: cubit.nameController,
            hintText: 'Name ',
            prefixIcon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 30.h),
          CustomTextFormField(
            controller: cubit.emailController,
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email, color: Colors.white),
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 30.h),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) => CustomTextFormField(
              controller: cubit.passwordController,
              obscureText: cubit.passwordObscure,
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock, color: Colors.white),
              suffixIcon: IconButton(
                onPressed: cubit.changePasswordVisibility,
                icon: Icon(
                  cubit.passwordObscure
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
              textInputType: TextInputType.visiblePassword,
            ),
          ),
          SizedBox(height: 30.h),
          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) => CustomTextFormField(
              controller: cubit.confirmPasswordController,
              obscureText: cubit.confirmPasswordObscure,
              hintText: 'Confirm Password',
              prefixIcon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                onPressed: cubit.changeConfirmPasswordVisibility,
                icon: Icon(
                  cubit.confirmPasswordObscure
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white,
                ),
              ),
              textInputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'برجاء ادخال كلمة المرور مرة اخري';
                }
                if (cubit.passwordController.text !=
                    cubit.confirmPasswordController.text) {
                  return 'كلمة مرور غير متطابقة';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 30.h),
        CustomTextFormField(
          controller: cubit.phoneController,
          hintText: 'Phone Number',
          prefixIcon: const Icon(Icons.phone, color: Colors.white),
          textInputType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'برجاء إدخال الرقم';
            }
            if (!RegExp(r'^\+2[0-9]+$').hasMatch(value)) {
              return 'برجاء إدخال +2 قبل الرقم';
            }
            return null;
          },
        )


        ],
      ),
    );
  }
}
