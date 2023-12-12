import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_soft/Core/Utils/app_assets.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isProfile;
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.isProfile = false,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.kWhite,
      leading: InkWell(
        onTap: () => GoRouter.of(context).pop(),
        child: const SizedBox(
          child: Icon(
            Icons.arrow_back,
            color: AppColor.kBlack,
          ),
        ),
      ),
      title: CustomText(
        text: title,
        color: AppColor.mainColor,
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Image.asset(
            AppAssets.cart,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
