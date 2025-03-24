import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/recourses/styles_manger/styles_manager.dart';
import 'package:movies/core/widgets/failure_state.dart';
import 'package:movies/core/widgets/loading_state.dart';

import '../../../../core/widgets/movie_card.dart';
import '../controller/top_rated_controller/top_rated_cubit.dart';
import '../controller/top_rated_controller/top_rated_state.dart';

class HomeViewTopRatedPart extends StatelessWidget {
  const HomeViewTopRatedPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Rated ",
                style: getRegularStyle(fontSize: 20),
              ),
             
            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<TopRatedCubit, TopRatedState>(
            builder: (context, state) {
              if (state is TopRatedSuccessState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => MovieCard(
                      image:
                          "${ApiConstants.imageBaseUrl}${state.model.results[index].posterPath}",
                      rate: state.model.results[index].voteAverage, id: state.model.results[index].id,
                    ),
                    itemCount: state.model.results.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                  ),
                );
              } else if (state is TopRatedFailureState) {
                return FailureState(state.errorMessage);
              } else {
                return const LoadingState();
              }
            },
          ),
        ],
      ),
    );
  }
}
