import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/recourses/styles_manger/styles_manager.dart';
import 'package:movies/core/widgets/failure_state.dart';
import 'package:movies/core/widgets/loading_state.dart';

import '../../../../core/widgets/movie_card.dart';
import '../../../browse_feature/presentation/controller/browse_controller/browse_cubit.dart';
import '../../../browse_feature/presentation/controller/browse_controller/browse_state.dart';

class HomeViewActionPart extends StatelessWidget {
  const HomeViewActionPart({super.key});

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
                "Action ",
                style: getRegularStyle(fontSize: 20),
              ),

            ],
          ),
          const SizedBox(height: 20),
          BlocBuilder<BrowseCubit, BrowseState>(
            builder: (context, state) {
              if (state is BrowseSuccessState) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => MovieCard(
                      image:
                          "${ApiConstants.imageBaseUrl}${state.browseModel.results[index].posterPath}",
                      rate: state.browseModel.results[index].voteAverage, id: state.browseModel.results[index].id,
                    ),
                    itemCount: state.browseModel.results.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 10.w,
                      );
                    },
                  ),
                );
              } else if (state is BrowseFailureState) {
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
