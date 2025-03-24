import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home_feature/presentation/controller/available_new_controller/available_new_cubit.dart';
import 'package:movies/features/home_feature/presentation/controller/top_rated_controller/top_rated_cubit.dart';
import 'package:movies/features/home_feature/presentation/controller/upcoming_controller/upcoming_cubit.dart';
import 'package:movies/features/home_feature/presentation/widgets/available_new_part.dart';
import 'package:movies/features/home_feature/presentation/widgets/home_view_action_part.dart';

import '../../../../core/services/service_locator.dart';
import '../../../browse_feature/presentation/controller/browse_controller/browse_cubit.dart';
import '../widgets/home_view_top_rated_part.dart';
import '../widgets/home_view_upcoming_part.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            BlocProvider(
              create: (context) =>
              sl.get<AvailableNewCubit>()
                ..getAvailableNew(),
              child: const AvailableNewPart(),
            ),
            BlocProvider(
              create: (context) => sl.get<BrowseCubit>()..getBrowse(28),
              child: const HomeViewActionPart(),
            ),
            BlocProvider(
              create: (context) => sl.get<TopRatedCubit>()..getTopRated(),
              child: const HomeViewTopRatedPart(),
            ),
            BlocProvider(
              create: (context) => sl.get<UpcomingCubit>()..getUpcoming(),
              child: const HomeViewUpcomingPart(),
            ),
          ],
        ),
      ),
    );
  }
}
