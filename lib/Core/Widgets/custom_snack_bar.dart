import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class CustomSnackBar {
  void showSuccessSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 300.w,
        elevation: 8,
        duration: const Duration(seconds: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: CustomText(
            text: message,
            fontSize: 18,
            color: AppColor.kBlack,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
    );
  }

  void showErrorSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 300.w,
        elevation: 8,
        duration: const Duration(seconds: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: CustomText(
            text: message,
            fontSize: 18,
            color: AppColor.kBlack,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
