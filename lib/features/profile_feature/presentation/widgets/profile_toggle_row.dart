import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/color_manager/color_manager.dart';
import 'package:movies/core/recourses/styles_manger/styles_manager.dart';
import 'package:movies/features/profile_feature/presentation/widgets/custom_profile_column.dart';

import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/failure_state.dart';
import '../../../../core/widgets/loading_state.dart';
import '../../../favorites_feature/presentation/controller/get_favorites/get_favorites_cubit.dart';
import '../../../favorites_feature/presentation/controller/get_favorites/get_favorites_state.dart';

class FavoritesRow extends StatelessWidget {
  const FavoritesRow({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => sl.get<GetFavoritesCubit>()..getFavorites(),
      child: BlocBuilder<GetFavoritesCubit, GetFavoritesState>(
        builder: (context, state) {
          if (state is GetFavoritesSuccessState) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Expanded(flex: 2,
                    child: CustomProfileColumn(
                      widget: Icon(Icons.menu,color: ColorManager.primary,size: 40,),
                      text: "Watch List",fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(child: Text("${state.model.data.length}",style:getBoldStyle(fontSize: 40,color: ColorManager.primary),))
                ],
              ),
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
