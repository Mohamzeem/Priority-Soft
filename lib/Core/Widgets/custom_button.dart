import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_circular_loading.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double? threeRadius;
  final double? lastRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final TextAlign? textAlign;
  final double? loadingWidth;
  final double? loadingHeight;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    this.threeRadius,
    this.lastRadius,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.textAlign,
    this.loadingWidth = 30,
    this.loadingHeight = 30,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: height.h,
        width: width.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColor.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(threeRadius ?? 5),
                topRight: Radius.circular(threeRadius ?? 5),
                bottomRight: Radius.circular(threeRadius ?? 5),
                bottomLeft: Radius.circular(lastRadius ?? 5),
              ),
            ),
          ),
          onPressed: onPressed,
          child: isLoading
              ? CustomCircularLoading(
                  height: loadingHeight!,
                  width: loadingWidth!,
                )
              : CustomText(
                  text: text,
                  color: textColor ?? AppColor.kWhite,
                  fontSize: fontSize ?? 20.sp,
                  fontWeight: fontWeight,
                  textAlign: textAlign,
                ),
        ),
      ),
    );
  }
}
