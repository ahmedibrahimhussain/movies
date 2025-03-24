import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/color_manager/color_manager.dart';
import 'package:movies/core/recourses/image_manager/image_manager.dart';
import 'package:movies/core/recourses/styles_manger/styles_manager.dart';
import 'package:movies/core/widgets/failure_state.dart';
import 'package:movies/core/widgets/loading_state.dart';
import 'package:movies/features/profile_feature/presentation/controller/profile_state.dart';
import 'package:movies/features/profile_feature/presentation/widgets/custom_profile_column.dart';

import '../../../../core/services/service_locator.dart';
import '../controller/profile_cubit.dart';

class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<ProfileCubit>()..getProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomProfileColumn(
                    widget: Image.asset(
                      ImageManager.avatar1,
                      height: 130.h,
                      fit: BoxFit.fill,
                    ),
                    text: state.model.data.name,
                  ),
                  Column(
                    children: [
                      CustomProfileColumn(
                        widget: Text(
                          "email",
                          style: getBoldStyle(
                              fontSize: 20, color: ColorManager.primary),
                        ),
                        text: state.model.data.email,
                      ),
                      SizedBox(height: 10.h),
                      CustomProfileColumn(
                        widget: Text(
                          "phone",
                          style: getBoldStyle(
                              fontSize: 20, color: ColorManager.primary),
                        ),
                        text: state.model.data.phone,
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is ProfileFailureState) {
            return FailureState(state.errorMessage);
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
