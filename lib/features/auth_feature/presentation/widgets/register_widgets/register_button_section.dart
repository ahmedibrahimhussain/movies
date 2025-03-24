import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/custom_navigation.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../../../../core/widgets/loading_state.dart';
import '../../controller/register_controller/register_cubit.dart';
import '../../controller/register_controller/register_state.dart';
import '../../pages/login_view.dart';

class RegisterButtonSection extends StatelessWidget {
  const RegisterButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) async {
        if (state is RegisterFailureState) {
          await customToast(state.errorMessage, ToastStatus.error);
        } else if (state is RegisterSuccessState) {
          await customToast('تم التسجيل بنجاح', ToastStatus.success);
          if(context.mounted) context.pushReplacement(const LoginView());

        }
      },
      buildWhen: (previous, current) =>
          current is RegisterLoadingState ||
          current is RegisterFailureState ||
          current is RegisterSuccessState,
      builder: (context, state) {
        if (state is RegisterLoadingState) {
          return const LoadingState();
        } else {
          return CustomButton(
            text: 'Create Account',
            onPressed: () async {
              if (BlocProvider.of<RegisterCubit>(context)
                  .key
                  .currentState!
                  .validate()) {
                await BlocProvider.of<RegisterCubit>(context)
                    .register( );
              }            }
          );
        }
      },
    );
  }
}
