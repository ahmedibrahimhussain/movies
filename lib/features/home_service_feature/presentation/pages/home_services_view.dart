import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/recourses/color_manager/color_manager.dart';
import 'package:movies/features/search_feature/presentation/controller/search_cubit.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../../../core/services/service_locator.dart';
import '../../../browse_feature/presentation/controller/browse_controller/browse_cubit.dart';
import '../../../browse_feature/presentation/controller/movies_category_controller/movies_category_cubit.dart';
import '../../../profile_feature/presentation/controller/profile_cubit.dart';
import '../controller/home_service_cubit.dart';

class HomeServicesView extends StatelessWidget {
  const HomeServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeServiceCubit>(create: (context) => sl.get<HomeServiceCubit>()),
        BlocProvider<BrowseCubit>(create: (context) => sl.get<BrowseCubit>()),
        BlocProvider<MoviesCategoryCubit>(create: (context) => sl.get<MoviesCategoryCubit>()..getMoviesCategory()),
        BlocProvider<SearchCubit>(create: (context) => sl.get<SearchCubit>()..getSearch()),
        BlocProvider<ProfileCubit>(create: (context) => sl.get<ProfileCubit>()..getProfile()),

      ],
      child: BlocBuilder<HomeServiceCubit, HomeServiceState>(
        builder: (context, state) {
          final cubit = context.read<HomeServiceCubit>();

          return PersistentTabView(
            context,
            controller: cubit.controller,
            screens:cubit. buildScreens(),
            items: cubit.navBarsItems(),
            backgroundColor: ColorManager.textFieldColor,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar:ColorManager.scaffoldBackGroundColor,
            ),
            navBarStyle: NavBarStyle.style1,
navBarHeight: 70,
          );
    }

      ),
    );
  }
}
