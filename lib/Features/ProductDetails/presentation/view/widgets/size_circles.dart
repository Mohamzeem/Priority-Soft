import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class SizeCircles extends StatelessWidget {
  const SizeCircles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
      child: const Row(
        children: [
          SizeCircle(
            text: '39',
            backgroundColor: AppColor.kWhite,
            color: AppColor.kGray,
          ),
          SizeCircle(
            text: '39.5',
            backgroundColor: AppColor.kWhite,
            color: AppColor.kGray,
          ),
          SizeCircle(
            text: '40',
            backgroundColor: AppColor.kWhite,
            color: AppColor.kGray,
          ),
          SizeCircle(
            text: '40.5',
            backgroundColor: AppColor.kWhite,
            color: AppColor.kGray,
          ),
          SizeCircle(
            text: '41',
            backgroundColor: AppColor.kBlack,
            color: AppColor.kWhite,
          ),
        ],
      ),
    );
  }
}

class SizeCircle extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  const SizeCircle(
      {Key? key,
      required this.text,
      required this.color,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: AppColor.kBackGround)),
        child: Center(
          child: CustomText(
            text: text,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
      ),
    );
  }
}
