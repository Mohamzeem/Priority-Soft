import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget suffix;
  final void Function()? onTap;
  const CustomAppBar(
      {Key? key, this.title = '', required this.suffix, this.onTap})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: onTap ?? () => GoRouter.of(context).pop(),
        child: const SizedBox(
          child: Icon(
            Icons.arrow_back,
            color: AppColor.kBlack,
          ),
        ),
      ),
      title: CustomText(
        text: title,
        color: AppColor.kBlack,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      centerTitle: true,
      actions: [
        suffix,
      ],
    );
  }
}
