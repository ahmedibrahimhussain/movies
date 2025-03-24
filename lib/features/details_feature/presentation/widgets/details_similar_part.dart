import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/widgets/failure_state.dart';
import 'package:movies/core/widgets/loading_state.dart';
import 'package:movies/features/details_feature/presentation/controller/similar_controller/similar_state.dart';

import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/movie_card.dart';
import '../controller/similar_controller/similar_cubit.dart';

class DetailsSimilarPart extends StatelessWidget {
  const DetailsSimilarPart({super.key,});


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SimilarCubit, SimilarState>(
      builder: (context, state) {
        if (state is SimilarSuccessState) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  "Similar",
                  style: getSemiBoldStyle(fontSize: 20),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: .7,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: state.model.results.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieCard(
                      image: "${ApiConstants.imageBaseUrl}${state.model.results[index].posterPath}",
                      rate: double.parse(state.model.results[index].voteAverage!.toStringAsFixed(1)),
                      id: state.model.results[index].id,
                    );
                  },
                )
              ],
            ),
          );
        } else if (state is SimilarFailureState) {
          return FailureState(state.errorMessage);
        } else {
          return const LoadingState();
        }
      },
    );
  }
}
