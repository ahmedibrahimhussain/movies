import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:movies/features/browse_feature/presentation/controller/browse_controller/browse_cubit.dart';
import 'package:movies/features/browse_feature/presentation/controller/movies_category_controller/movies_category_cubit.dart';
import 'package:movies/features/browse_feature/presentation/widgets/browse_view_grid_part.dart';
import 'package:movies/features/browse_feature/presentation/widgets/browse_view_top_row_part.dart';


class BrowseView extends StatefulWidget {
  const BrowseView({super.key});

  @override
  State<BrowseView> createState() => _BrowseViewState();
}

class _BrowseViewState extends State<BrowseView> {
  @override
  void initState() {
    BlocProvider.of<BrowseCubit>(context)
        .getBrowse(BlocProvider.of<MoviesCategoryCubit>(context).genres.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              const BrowseViewTopRowPart(),
              const SizedBox(height: 20),
              const BrowseViewGridPart(),
            ],
          ),
        ),
      ),
    );
  }
}
