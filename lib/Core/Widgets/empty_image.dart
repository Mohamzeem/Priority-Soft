import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_assets.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class EmptyPage extends StatelessWidget {
  final String title;
  const EmptyPage({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 120.h),
      child: Opacity(
        opacity: 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.emptyPage),
            SizedBox(height: 15.h),
            CustomText(
              text: title,
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: AppColor.kBlack,
            ),
          ],
        ),
      ),
    );
  }
}
