import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/styles_manger/styles_manager.dart';

class CustomProfileColumn extends StatelessWidget {
  const CustomProfileColumn({
    super.key,
    required this.widget,
    required this.text,
     this.fontSize,
  });
  final Widget widget;
  final String? text;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget,
        SizedBox(height: 6.h),
        SizedBox(width: 180.w,
          child: Center(
            child: Text(
              text??"",
              style: getMediumStyle(fontSize: fontSize??18),
            ),
          ),
        ),
      ],
    );
  }
}
