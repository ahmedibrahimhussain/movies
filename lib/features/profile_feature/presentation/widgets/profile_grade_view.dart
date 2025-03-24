import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/widgets/failure_state.dart';
import 'package:movies/core/widgets/loading_state.dart';
import 'package:movies/features/favorites_feature/presentation/controller/get_favorites/get_favorites_cubit.dart';
import 'package:movies/features/favorites_feature/presentation/controller/get_favorites/get_favorites_state.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/movie_card.dart';

class ProfileGradeView extends StatelessWidget {
  const ProfileGradeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<GetFavoritesCubit>()..getFavorites(),
      child: BlocBuilder<GetFavoritesCubit, GetFavoritesState>(
        builder: (context, state) {
          if (state is GetFavoritesSuccessState) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: state.model.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onLongPress: () {
                    BlocProvider.of<GetFavoritesCubit>(context).delFavorites(
                        int.parse(state.model.data[index].movieId!));
                  },
                  child: MovieCard(
                    image: state.model.data[index].imageURL,
                    rate: state.model.data[index].rating,
                    id: int.parse(state.model.data[index].movieId!),
                  ),
                );
              },
            );
          } else if (state is GetFavoritesFailureState) {
            return FailureState(state.errorMessage);
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
