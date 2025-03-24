import 'package:equatable/equatable.dart';

class RegisterBody extends Equatable {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final int avaterId = 1;

  const RegisterBody({
    required this.name,
    required this.phone,
    required this.password,
    required this.email,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phone': phone,
      'avaterId': avaterId,
    };
  }

  @override
  List<Object?> get props => [
        name,
        phone,
        password,
        email,
        avaterId,
        confirmPassword,
      ];
}
