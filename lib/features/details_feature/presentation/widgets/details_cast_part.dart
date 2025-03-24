import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/widgets/failure_state.dart';
import 'package:movies/core/widgets/loading_state.dart';
import 'package:movies/features/details_feature/presentation/widgets/cast_card.dart';

import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../controller/cast_controller/cast_cubit.dart';
import '../controller/cast_controller/cast_state.dart';

class DetailsCastPart extends StatelessWidget {
  const DetailsCastPart({super.key, });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCubit, CastState>(
      builder: (context, state) {
        if (state is CastSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  "Cast",
                  style: getSemiBoldStyle(fontSize: 20),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.castModel.cast.length ,
                  itemBuilder: (context, index) {
                    return  CastCard(cast: state.castModel.cast[index],);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10.h);
                  },
                )
              ],
            ),
          );
        } else if (state is CastFailureState) {
          return FailureState(state.errorMessage);
        } else {
          return const LoadingState();
        }
      },
    );
  }
}
