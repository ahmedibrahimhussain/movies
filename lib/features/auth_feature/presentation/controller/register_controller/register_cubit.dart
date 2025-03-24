import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/auth_feature/data/models/register_models/register_body.dart';

import '../../../../../core/api/failure.dart';
import '../../../data/models/register_models/register_model.dart';
import '../../../data/repo/auth_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo _authRepo;

  late TextEditingController nameController,
      phoneController,
      confirmPasswordController,
      emailController,
      passwordController;
  RegisterCubit(this._authRepo) : super(RegisterInitialState()) {
    nameController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool passwordObscure = true;
  bool confirmPasswordObscure = true;


  Future<void> register( ) async {
    emit(RegisterLoadingState());


    RegisterBody body = RegisterBody(
        name: nameController.text,
        phone: phoneController.text,
        password: passwordController.text,
        email: emailController.text,
        confirmPassword: confirmPasswordController.text);
    final Either<Failure, RegisterModel> data = await _authRepo.register(body);

    data.fold(
      (l) => emit(RegisterFailureState(l.errorMessage)),
      (r) => emit(RegisterSuccessState(r)),
    );
  }

  void changePasswordVisibility() {
    passwordObscure = !passwordObscure;
    emit(RegisterPasswordVisibilityState());
  }

  void changeConfirmPasswordVisibility() {
    confirmPasswordObscure = !confirmPasswordObscure;
    emit(RegisterConfirmPasswordVisibilityState());
  }

}
