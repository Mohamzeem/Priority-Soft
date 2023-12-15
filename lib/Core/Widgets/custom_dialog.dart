import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_button.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class CustomDialog {
  void twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton,
    required void Function() onPressed,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.kWhite,
          title: Center(
            child: CustomText(
              text: textBody,
              color: AppColor.kBlack,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  onPressed: onPressed,
                  backgroundColor: AppColor.kred,
                  text: textButton,
                  width: 90,
                  height: 45,
                  lastRadius: 20,
                  threeRadius: 20,
                  textColor: AppColor.kWhite,
                ),
                CustomButton(
                  onPressed: () => GoRouter.of(context).pop(),
                  backgroundColor: AppColor.kBlack,
                  text: 'No',
                  width: 90,
                  height: 45,
                  lastRadius: 20,
                  threeRadius: 20,
                  textColor: AppColor.kWhite,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
