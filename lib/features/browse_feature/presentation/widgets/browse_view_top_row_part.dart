import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widgets/failure_state.dart';
import 'package:movies/core/widgets/loading_state.dart';
import 'package:movies/features/browse_feature/presentation/controller/movies_category_controller/movies_category_cubit.dart';
import 'package:movies/features/browse_feature/presentation/controller/movies_category_controller/movies_category_state.dart';
import 'package:movies/features/browse_feature/presentation/widgets/movies_category_card.dart';

class BrowseViewTopRowPart extends StatelessWidget {
  const BrowseViewTopRowPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCategoryCubit, MoviesCategoryState>(
      builder: (context, state) {
        if (state is MoviesCategorySuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .06,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MoviesCategoryCard(
                    genres: BlocProvider.of<MoviesCategoryCubit>(context)
                        .model!
                        .genres[index]);
              },
              itemCount: BlocProvider.of<MoviesCategoryCubit>(context)
                  .model!
                  .genres
                  .length,
            ),
          );
        } else if (state is MoviesCategoryFailureState) {
          return FailureState(state.errorMessage);
        } else {
          return const LoadingState();
        }
      },
    );
  }
}
