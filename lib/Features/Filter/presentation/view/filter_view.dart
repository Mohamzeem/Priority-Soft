import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_appbar.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Features/Filter/presentation/view/widgets/brands_list.dart';
import 'package:priority_soft/Features/Filter/presentation/view/widgets/color_buttons_list.dart';
import 'package:priority_soft/Features/Filter/presentation/view/widgets/gender_buttons_list.dart';
import 'package:priority_soft/Features/Filter/presentation/view/widgets/price_slider.dart';
import 'package:priority_soft/Features/Filter/presentation/view/widgets/reset_apply_buttons.dart';
import 'package:priority_soft/Features/Filter/presentation/view/widgets/sorted_by_buttons_list.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        suffix: SizedBox(),
        title: 'Filter',
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //^ brands text
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, bottom: 15.h),
                    child: const CustomText(
                      text: 'Brands',
                      color: AppColor.kBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  //^ Brands list
                  const BrandsList(),
                  //^ price range text
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                    child: const CustomText(
                      text: 'Price Range',
                      color: AppColor.kBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const PriceSlider(),
                  //^ sorted by text
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                    child: const CustomText(
                      text: 'Sort By',
                      color: AppColor.kBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  //^ sorted by buttons list
                  const SortedByButtonsList(),
                  //^ gender text
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                    child: const CustomText(
                      text: 'Gender',
                      color: AppColor.kBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  //^ gender buttons list
                  const GenderButtonsList(),
                  //^ gender text
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 15.h),
                    child: const CustomText(
                      text: 'Color',
                      color: AppColor.kBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  //^ gender buttons list
                  const ColorButtonsList(),
                ],
              ),
            ),
          ),
          const Spacer(),
          //^ reset & apply button
          const ResetApplyButtons()
        ],
      ),
    );
  }
}
