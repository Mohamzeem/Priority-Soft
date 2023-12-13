import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_button.dart';

class ResetApplyButtons extends StatelessWidget {
  const ResetApplyButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.w,
      decoration: BoxDecoration(color: AppColor.kWhite, boxShadow: [
        BoxShadow(
          blurRadius: 30,
          color: AppColor.kSecWhite.withOpacity(0.2),
        ),
      ]),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () {},
              text: 'Reset (4)',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              textColor: AppColor.kBlack,
              width: 150,
              height: 50,
              backgroundColor: AppColor.kWhite,
              threeRadius: 30,
              lastRadius: 30,
            ),
            CustomButton(
              onPressed: () {},
              text: 'Apply',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              textColor: AppColor.kWhite,
              width: 150,
              height: 50,
              backgroundColor: AppColor.kBlack,
              threeRadius: 30,
              lastRadius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
