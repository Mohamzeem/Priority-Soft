import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.kWhite,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.kWhite,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.kWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColor.kWhite,
        systemNavigationBarColor: AppColor.kWhite,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}
