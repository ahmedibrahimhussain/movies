import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies/features/details_feature/data/model/details_model.dart';

import '../../../../core/recourses/styles_manger/styles_manager.dart';


class DetailsSummaryPart extends StatelessWidget {
  const DetailsSummaryPart({super.key, required this.model});
final DetailsModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            "Summary",
            style: getSemiBoldStyle(fontSize: 20),
          ),
          SizedBox(height: 20.h),
          Text(
            '''${model.overview}''',
            style: getRegularStyle(),
          ),
        ],
      ),
    );
  }
}
