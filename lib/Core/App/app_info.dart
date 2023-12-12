import 'dart:io';
import 'package:flutter/services.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';

class MyApp {
  MyApp._();

  static String appName = 'PrioritySoft';
  static String fontFamily = 'Urbanist';
  static Size designSize = const Size(375, 812);

  static void setSystemUi() {
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: AppColor.kWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColor.kWhite,
        systemNavigationBarColor: AppColor.kWhite,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
