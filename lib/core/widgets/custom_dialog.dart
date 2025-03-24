import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../recourses/color_manager/color_manager.dart';

AwesomeDialog customDialog({
  required BuildContext context,
  required String title,
  String? description,
  required Function() btnOkOnPress,
   Function()? btnCancelOnPress,
  required DialogType dialogType,
  String? btnOkText,
  String? btnCancelText,
}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.scale,
    headerAnimationLoop: false,
    title: title,
    desc: description,
    btnOk: ElevatedButton(
      onPressed: btnOkOnPress,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(ColorManager.primary),
        foregroundColor: WidgetStateProperty.all<Color>(ColorManager.white),
      ),
      child: Text(btnOkText ?? 'تم'),
    ),
    btnCancel: ElevatedButton(
      onPressed:btnCancelOnPress?? () {
        Navigator.of(context).pop();
      },
      style: ButtonStyle(
        side: WidgetStateProperty.all<BorderSide>(
          const BorderSide(
            color: ColorManager.primary,
            width: 1,
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(ColorManager.white),
        foregroundColor: WidgetStateProperty.all<Color>(ColorManager.primary),
      ),
      child: Text(btnCancelText ?? 'إعادة أرسال'),
    ),
  )..show();
}
