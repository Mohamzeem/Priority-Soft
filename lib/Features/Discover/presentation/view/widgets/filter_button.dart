import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_assets.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30.w,
          ),
          SizedBox(
            height: 40,
            child: ElevatedButton.icon(
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(backgroundColor: AppColor.kBlack),
                icon: Image.asset(AppAssets.filterBtn),
                label: const CustomText(
                  text: 'FILTER',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )),
          )
        ],
      ),
    );
  }
}
