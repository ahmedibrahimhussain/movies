import 'package:equatable/equatable.dart';

class LoginBody extends Equatable {
  final String password;
  final String email;

  const LoginBody({
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'email': email,
    };
  }

  @override
  List<Object?> get props => [
        password,
        email,
      ];
}
