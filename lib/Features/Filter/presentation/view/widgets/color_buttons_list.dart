import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Utils/app_lists.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class ColorButtonsList extends StatefulWidget {
  const ColorButtonsList({super.key});

  @override
  State<ColorButtonsList> createState() => _ColorButtonsListState();
}

class _ColorButtonsListState extends State<ColorButtonsList> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppLists.colorButtons.length,
        itemBuilder: (context, index) {
          final btn = AppLists.colorButtons[index];
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: SizedBox(
              height: 40.h,
              width: btn.width.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.kWhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      side: BorderSide(
                        color: currentindex == index
                            ? AppColor.kBlack
                            : Colors.transparent,
                        width: 2,
                      )),
                ),
                onPressed: () {
                  setState(() {
                    currentindex = index;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: btn.circleColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    CustomText(
                      text: btn.title,
                      color: AppColor.kBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
