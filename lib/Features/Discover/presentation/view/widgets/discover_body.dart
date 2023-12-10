import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_circular_loading.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Features/Discover/presentation/view/widgets/discover_bar.dart';
import 'package:priority_soft/Features/Discover/presentation/view_model/categories_cubit/categories_cubit.dart';

class DiscoverBody extends StatefulWidget {
  const DiscoverBody({super.key});

  @override
  State<DiscoverBody> createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const DiscoverBar(),
          SizedBox(height: 10.h),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is GetCategoriesEmptyState) {
                return CustomText(text: state.emptyMsg);
              } else if (state is GetCategoriesLoadingState) {
                return CustomCircularLoading(height: 15.h, width: 15.w);
              } else if (state is GetCategoriesFailureState) {
                return CustomText(text: state.failMsg);
              } else if (state is GetCategoriesSuccessfullState) {
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categorieslist.length,
                    itemBuilder: (context, index) {
                      final item = state.categorieslist[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 15.w),
                        child: CustomText(
                          text: item.title!,
                          color: AppColor.kGray,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      );
                    },
                  ),
                );
              }
              return CustomCircularLoading(height: 15.h, width: 15.w);
            },
          ),
          SizedBox(height: 10.h)
        ],
      ),
    ));
  }
}
