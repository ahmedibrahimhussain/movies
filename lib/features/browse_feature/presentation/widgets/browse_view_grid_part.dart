import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/widgets/failure_state.dart';
import 'package:movies/core/widgets/loading_state.dart';
import 'package:movies/features/browse_feature/presentation/controller/browse_controller/browse_cubit.dart';
import 'package:movies/features/browse_feature/presentation/controller/browse_controller/browse_state.dart';

import '../../../../core/widgets/movie_card.dart';

class BrowseViewGridPart extends StatelessWidget {
  const BrowseViewGridPart({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BrowseCubit, BrowseState>(
      builder: (context, state) {
        if (state is BrowseSuccessState) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .7,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: state.browseModel.results.length,
            itemBuilder: (BuildContext context, int index) {
              return MovieCard(
                image:
                    "${ApiConstants.imageBaseUrl}${state.browseModel.results[index].posterPath}",
                rate: state.browseModel.results[index].voteAverage,
                id: state.browseModel.results[index].id,
              );
            },
          );
        } else if (state is BrowseFailureState) {
          return FailureState(state.errorMessage);
        } else {
          return const LoadingState();
        }
      },
    );
  }
}
