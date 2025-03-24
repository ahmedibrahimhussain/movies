import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final String message;
  final String data;

  const LoginModel({
    required this.data,
    required this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      data: json['data'],
    );
  }

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}
