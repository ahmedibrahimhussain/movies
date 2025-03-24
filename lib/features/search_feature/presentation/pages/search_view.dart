import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/color_manager/color_manager.dart';
import 'package:movies/core/widgets/custom_text_field.dart';
import 'package:movies/features/search_feature/presentation/controller/search_cubit.dart';
import 'package:movies/features/search_feature/presentation/widgets/search_view_grid_part.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              CustomTextFormField(
                controller: BlocProvider
                    .of<SearchCubit>(context)
                    .searchKeyword,
                hintText: "Search",
                prefixIcon: const Icon(
                  Icons.search,
                  color: ColorManager.white,
                ), onChanged: (p0) async {
                await BlocProvider.of<SearchCubit>(context).getSearch();
                return;
              },
              ),
              const SizedBox(height: 20),
              const SearchViewGridPart(),
            ],
          ),
        ),
      ),
    );
  }
}
