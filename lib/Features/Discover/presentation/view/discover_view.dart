import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Utils/app_strings.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Features/Discover/data/repo/api.dart';

class DivsoverView extends StatelessWidget {
  const DivsoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: 'Discover',
                  color: AppColor.kBlack,
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
                InkWell(
                  onTap: () {
                    ProductsApi().getData();
                  },
                  child: Image.asset(
                    AppStrings.cart,
                    width: 24.w,
                    height: 24.h,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
