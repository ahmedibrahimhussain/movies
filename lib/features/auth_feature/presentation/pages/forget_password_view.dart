import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/recourses/image_manager/image_manager.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(ImageManager.forgetPassImage),
            CustomTextFormField(
              hintText: 'Email',
              prefixIcon: const Icon(Icons.email,color: Colors.white,),
              textInputType: TextInputType.emailAddress,

              validator: (value) {
                if (value!.isEmpty) {
                  return 'من فضلك ادخل رقم البريد الالكترونى';
                }
                return null;
              },
            ),
            SizedBox(height: 40.h),
            CustomButton(
              text: "Verify Email",
              onPressed: () {

              },
            ),
          ],
        )
      ),
    );
  }
}
