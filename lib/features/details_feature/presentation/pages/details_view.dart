import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/details_feature/presentation/controller/cast_controller/cast_cubit.dart';
import 'package:movies/features/details_feature/presentation/controller/details_controller/details_cubit.dart';
import 'package:movies/features/details_feature/presentation/widgets/details_button_part.dart';
import 'package:movies/features/details_feature/presentation/widgets/details_cast_part.dart';
import 'package:movies/features/details_feature/presentation/widgets/details_play_part.dart';
import 'package:movies/features/details_feature/presentation/widgets/details_screen_shots_part.dart';
import 'package:movies/features/details_feature/presentation/widgets/details_similar_part.dart';
import 'package:movies/features/details_feature/presentation/widgets/details_summary_part.dart';
import 'package:movies/features/favorites_feature/presentation/controller/add_favorites/add_favorites_cubit.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/failure_state.dart';
import '../../../../core/widgets/loading_state.dart';
import '../controller/details_controller/details_state.dart';
import '../controller/similar_controller/similar_cubit.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailsCubit>(
            create: (context) => sl.get<DetailsCubit>()..getDetails(id)),
        BlocProvider<AddFavoritesCubit>(
            create: (context) => sl.get<AddFavoritesCubit>()..getIsMovieFavorite( id: id)),
      ],
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              BlocBuilder<DetailsCubit, DetailsState>(
                builder: (context, state) {
                  if (state is DetailsSuccessState) {
                    return Column(
                      children: [
                        DetailsPlayPart(
                          model: state.model,
                        ),
                        DetailsButtonPart(
                          model: state.model,
                        ),
                        DetailsSummaryPart(
                          model: state.model,
                        ),
                        DetailsScreenShotsPart(
                          model: state.model,
                        ),
                      ],
                    );
                  } else if (state is DetailsFailureState) {
                    return FailureState(state.errorMessage);
                  } else {
                    return const LoadingState();
                  }
                },
              ),
              BlocProvider(
                create: (context) => sl.get<CastCubit>()..getCast(id),
                child: const DetailsCastPart(),
              ),
              BlocProvider(
                create: (context) => sl.get<SimilarCubit>()..getSimilar(id),
                child: const DetailsSimilarPart(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
