import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/custom_navigation.dart';
import 'package:movies/features/home_service_feature/presentation/pages/home_services_view.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/loading_state.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../../../main.dart';
import '../../controller/login_controller/login_cubit.dart';
import '../../controller/login_controller/login_state.dart';

class LoginButtonSection extends StatelessWidget {
  const LoginButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          current is LoginLoadingState ||
          current is LoginFailureState ||
          current is LoginSuccessState,
      listener: (context, state) async {
        if (state is LoginFailureState) {
          await customToast(state.errorMessage, ToastStatus.error);
        } else if (state is LoginSuccessState) {
          await customToast('تم تسجيل الدخول بنجاح', ToastStatus.success);

          context.push(const HomeServicesView());


        }
       },
      builder: (context, state) {
        if (state is LoginLoadingState) {
          return const LoadingState();
        } else {
          return CustomButton(
            text: "Login ",
            onPressed: () async {
              if (BlocProvider.of<LoginCubit>(context)
                  .key
                  .currentState!
                  .validate()) {
                await BlocProvider.of<LoginCubit>(context).login(context);

                await SecureStorage.write('isLogin', 'true');
                isLogin = true;
             }
            },
          );
        }
      },
    );
  }
}
