import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../controller/login_controller/login_cubit.dart';
import '../../controller/login_controller/login_state.dart';

class LoginViewTextFieldSection extends StatelessWidget {
  const LoginViewTextFieldSection({
    super.key
  });
  @override
  Widget build(BuildContext context) {
    final LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: cubit.key,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email,color: Colors.white,),
            controller: cubit.emailController,
            textInputType: TextInputType.emailAddress,

            // validator: (value) {
            //   if (value!.isEmpty) {
            //     return 'من فضلك ادخل رقم البريد الالكترونى';
            //   }
            //   return null;
            // },
          ),
          SizedBox(height: 30.h),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) => CustomTextFormField(
              obscureText: cubit.passwordObscure,
              hintText: 'Password',
              controller: cubit.passwordController,
              prefixIcon :
              const Icon( Icons.lock,color: Colors.white,),
              suffixIcon: IconButton(
                onPressed: cubit.changePasswordVisibility,
                icon: Icon(
                  cubit.passwordObscure
                      ? Icons.visibility
                      : Icons.visibility_off,
               color: Colors.white, ),
              ),
              textInputType: TextInputType.visiblePassword,
              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'من فضلك ادخل كلمة المرور';
              //   }
              //   return null;
              // },
            ),
          ),
        ],
      ),
    );
  }
}
