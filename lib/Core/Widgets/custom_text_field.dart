import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hint;
  final IconData suffix;
  final bool readOnly;
  final TextInputType keyBoard;
  final int maxLength;
  const CustomTextFormField({
    Key? key,
    this.controller,
    this.hint = 'hint',
    this.title = 'title',
    this.readOnly = false,
    required this.keyBoard,
    this.maxLength = 6,
    required this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColor.kWhite,
          ),
          SizedBox(height: 8.h),
          TextFormField(
            // textAlign: TextAlign.center,
            controller: controller,
            keyboardType: keyBoard,
            inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
            cursorColor: AppColor.kWhite,
            textInputAction: TextInputAction.done,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 22,
              color: AppColor.kWhite,
            ),
            decoration: InputDecoration(
              suffixIcon: Icon(
                suffix,
                color: AppColor.kWhite,
                size: 30,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
              hintText: hint,
              hintStyle: const TextStyle(
                fontSize: 16,
                color: AppColor.kWhite,
              ),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    width: 1.5,
                    color: AppColor.kWhite,
                  )),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    width: 1.5,
                    color: AppColor.kWhite,
                  )),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    width: 1.5,
                    color: AppColor.kWhite,
                  )),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    width: 1.5,
                    color: AppColor.kWhite,
                  )),
              focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    width: 1.5,
                    color: Colors.red,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
