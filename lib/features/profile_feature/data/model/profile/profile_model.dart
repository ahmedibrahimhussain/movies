import 'package:equatable/equatable.dart';
import 'package:movies/features/profile_feature/data/model/profile/profile_data_model.dart';


class ProfileModel extends Equatable {
  final ProfileDataModel data;

  const ProfileModel({
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      data: ProfileDataModel.fromJson(json['data']),
    );
  }

  @override
  List<Object?> get props => [
    data,
  ];
}
