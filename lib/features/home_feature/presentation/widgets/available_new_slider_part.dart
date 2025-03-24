import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/utils/custom_navigation.dart';
import 'package:movies/core/widgets/failure_state.dart';
import 'package:movies/core/widgets/loading_state.dart';
import 'package:movies/core/widgets/movie_card.dart';
import 'package:movies/features/home_feature/presentation/controller/available_new_controller/available_new_cubit.dart';
import 'package:movies/features/home_feature/presentation/controller/available_new_controller/available_new_state.dart';

import '../../../details_feature/presentation/pages/details_view.dart';

class AvailableNewSliderPart extends StatelessWidget {
  const AvailableNewSliderPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableNewCubit, AvailableNewState>(
      builder: (context, state) {
        if (state is AvailableNewSuccessState) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: state.availableNewModel.results.length,
              itemBuilder: (context, index, realIndex) => GestureDetector(
                onTap: () {
                  context.push(DetailsView(id: state.availableNewModel.results[index].id,));
                },
                child: MovieCard(
                  image:
                      "${ApiConstants.imageBaseUrl}${state.availableNewModel.results[index].posterPath}",
                  rate: state.availableNewModel.results[index].voteAverage, id: state.availableNewModel.results[index].id,
                ),
              ),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .35,
                enlargeCenterPage: true,
                viewportFraction: 0.55,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
              ),
            ),
          );
        } else if (state is AvailableNewFailureState) {
          return FailureState(state.errorMessage);
        } else {
          return const Center(
            child: SizedBox(
              width: 500,
              height: 200,
              child: LoadingState(),
            ),
          );
        }
      },
    );
  }
}
