import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Utils/app_lists.dart';
import 'package:priority_soft/Core/Widgets/custom_button.dart';

class SortedByButtonsList extends StatefulWidget {
  const SortedByButtonsList({super.key});

  @override
  State<SortedByButtonsList> createState() => _SortedByButtonsListState();
}

class _SortedByButtonsListState extends State<SortedByButtonsList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppLists.sortedButtons.length,
        itemBuilder: (context, index) {
          final btn = AppLists.sortedButtons[index];
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: CustomButton(
              onPressed: () => setState(() => currentIndex = index),
              text: btn.title,
              width: btn.width,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              height: 40,
              lastRadius: 30,
              threeRadius: 30,
              backgroundColor:
                  currentIndex == index ? AppColor.kBlack : AppColor.kWhite,
              textColor:
                  currentIndex == index ? AppColor.kWhite : AppColor.kBlack,
            ),
          );
        },
      ),
    );
  }
}
