import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/api/api_constants.dart';
import 'package:movies/core/recourses/color_manager/color_manager.dart';
import 'package:movies/core/widgets/loading_state.dart';
import 'package:movies/features/favorites_feature/presentation/controller/add_favorites/add_favorites_cubit.dart';
import 'package:movies/features/favorites_feature/presentation/controller/add_favorites/add_favorites_state.dart';

import '../../data/model/details_model.dart';

class AddToFavoritesPart extends StatelessWidget {
  const AddToFavoritesPart({super.key, required this.model});
  final DetailsModel model;

  @override

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFavoritesCubit, AddFavoritesState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<AddFavoritesCubit>(context);
        if (state is AddFavoritesLoadingState) {
          return const LoadingState();
        }
        else {
          return IconButton(
              onPressed: () {BlocProvider.of<AddFavoritesCubit>(context).addFavorites(
                    imageURL: "${ApiConstants.imageBaseUrl}${model.posterPath}",
                    movieId: "${model.id}",
                    rating: model.voteAverage,
                    name: model.title,
                    year: model.releaseDate);
              },
              icon: Icon(
                Icons.favorite,
                size: 50,
                color: cubit.isFavorites
                    ? Colors.amber
                    : ColorManager.textFieldColor,
              ));
        }
      },
    );
  }
}
