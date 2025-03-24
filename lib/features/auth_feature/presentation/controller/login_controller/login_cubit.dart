import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/auth_feature/data/models/login_models/login_body.dart';

import '../../../../../core/api/failure.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../data/models/login_models/login_model.dart';
import '../../../data/repo/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  late TextEditingController emailController, passwordController;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool passwordObscure = true;

  LoginCubit(this._authRepo) : super(LoginInitialState()) {
    emailController = TextEditingController();
    passwordController  = TextEditingController();
  }


  Future<void> login(BuildContext context) async {
    emit(LoginLoadingState());
    LoginBody body=LoginBody(password:passwordController.text, email:  emailController.text);
    final Either<Failure, LoginModel> data = await _authRepo.login(body);

    data.fold(
      (l) => emit(LoginFailureState(l.errorMessage)),
      (r)async {
        emit(LoginSuccessState(r));

        await SecureStorage.write('authToken', r.data);

      },
    );
  }

  void changePasswordVisibility() {
    passwordObscure = !passwordObscure;
    emit(LoginPasswordVisibilityState());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();

    return super.close();
  }
}
