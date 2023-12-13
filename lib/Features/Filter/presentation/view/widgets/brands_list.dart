// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_assets.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_cashed_image.dart';
import 'package:priority_soft/Core/Widgets/custom_circular_loading.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Features/Discover/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:priority_soft/Features/Discover/presentation/view_model/products_cubit/products_cubit.dart';

class BrandsList extends StatefulWidget {
  const BrandsList({Key? key}) : super(key: key);

  @override
  State<BrandsList> createState() => _BrandsListState();
}

class _BrandsListState extends State<BrandsList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 97.h,
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
                final brand = state.categorieslist[index];
                if (brand.title == 'All') {
                  return const SizedBox.shrink();
                } else {
                  return Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: InkWell(
                        onTap: () {
                          setState(() => currentIndex = index);
                        },
                        child: Column(
                          children: [
                            //^ brand photo
                            Container(
                              margin: EdgeInsets.only(bottom: 8.h),
                              decoration: const BoxDecoration(
                                color: AppColor.kBackGround,
                                shape: BoxShape.circle,
                              ),
                              child: Stack(
                                children: [
                                  CustomCashedImage(
                                    imageUrl: brand.photo!,
                                    width: 50,
                                    height: 50,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: currentIndex == index
                                        ? Image.asset(AppAssets.tickCircle)
                                        : const SizedBox(),
                                  )
                                ],
                              ),
                            ),
                            //^ brand title
                            CustomText(
                              text: brand.title!,
                              color: AppColor.kBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                            //^ brand items
                            CustomText(
                              text: '${brand.items!} Items',
                              color: AppColor.kGray,
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ],
                        )),
                  );
                }
              },
            );
          }
          return CustomCircularLoading(height: 25.h, width: 25.w);
        },
      ),
    );
  }
}
