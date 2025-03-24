import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/recourses/image_manager/image_manager.dart';
import 'package:movies/core/widgets/failure_state.dart';

import '../../../../core/widgets/movie_card.dart';
import '../controller/search_cubit.dart';
import '../controller/search_state.dart';

class SearchViewGridPart extends StatelessWidget {
  const SearchViewGridPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .7,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: state.model.results.length,
            itemBuilder: (BuildContext context, int index) {
              return MovieCard(
                image:
                    "${ApiConstants.imageBaseUrl}${state.model.results[index].posterPath}",
                rate: state.model.results[index].voteAverage,
                id: state.model.results[index].id,
              );
            },
          );
        } else if (state is SearchFailureState) {
          return FailureState(state.errorMessage);
        } else {
          return Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .30),
              Image.asset(ImageManager.emptyImage)],
          );
        }
      },
    );
  }
}
