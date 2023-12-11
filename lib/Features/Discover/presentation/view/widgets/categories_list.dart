import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_circular_loading.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Features/Discover/data/categories_repo/categories_api.dart';
import 'package:priority_soft/Features/Discover/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:priority_soft/Features/Discover/presentation/view_model/products_cubit/products_cubit.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesEmptyState) {
            return CustomText(text: state.emptyMsg);
          } else if (state is GetCategoriesLoadingState) {
            return CustomCircularLoading(height: 25.h, width: 25.w);
          } else if (state is GetCategoriesFailureState) {
            return CustomText(text: state.failMsg);
          } else if (state is GetCategoriesSuccessfullState) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categorieslist.length,
              itemBuilder: (context, index) {
                final item = state.categorieslist[index];
                return Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: InkWell(
                    onTap: () {
                      if (item.title! == 'All') {
                        BlocProvider.of<ProductsCubit>(context).getProducts();
                      } else {
                        CategoriesApi().searchProductsByMark(mark: item.title!);
                      }
                      setState(() => currentIndex = index);
                    },
                    child: CustomText(
                      text: item.title!,
                      color: currentIndex == index
                          ? AppColor.kBlack
                          : AppColor.kGray,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                );
              },
            );
          }
          return CustomCircularLoading(height: 25.h, width: 25.w);
        },
      ),
    );
  }
}
