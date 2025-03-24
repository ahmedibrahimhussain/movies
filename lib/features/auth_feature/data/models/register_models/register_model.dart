import 'package:equatable/equatable.dart';

import 'register_data_model.dart';

class RegisterModel extends Equatable {
  final RegisterDataModel data;

  const RegisterModel({
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      data: RegisterDataModel.fromJson(json['data']),
    );
  }

  @override
  List<Object?> get props => [
        data,
  ];
}
