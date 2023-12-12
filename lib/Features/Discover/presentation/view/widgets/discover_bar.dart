import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_assets.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Features/Reviews/data/stars_api.dart';

class DiscoverBar extends StatelessWidget {
  const DiscoverBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            StarsApi().getStars();
          },
          child: Image.asset(
            AppAssets.cart,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
