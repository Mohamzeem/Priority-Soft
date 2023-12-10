import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/App/app_bloc_providers.dart';
import 'package:priority_soft/Core/App/app_info.dart';
import 'package:priority_soft/Core/Routes/routes.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProvider,
      child: ScreenUtilInit(
        designSize: MyApp.designSize,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp.router(
            title: MyApp.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: MyApp.fontFamily,
              scaffoldBackgroundColor: AppColor.kWhite,
            ),
            routerConfig: AppRoutes().router,
          ),
        ),
      ),
    );
  }
}
