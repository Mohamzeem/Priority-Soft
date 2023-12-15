import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:priority_soft/Core/Widgets/custom_circular_loading.dart';
import 'package:priority_soft/Core/Widgets/custom_snack_bar.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/Widgets/empty_image.dart';
import 'package:priority_soft/Features/Discover/presentation/view/widgets/product_item.dart';
import 'package:priority_soft/Features/Discover/presentation/view_model/products_cubit/products_cubit.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is SearchProductsSuccessfullState) {
          return CustomSnackBar().showSuccessSnackBar(
              context: context, message: 'Products Loaded Successfully');
        }
        // else if (state is GetProductsSuccessfullState) {
        //   return CustomSnackBar().showSuccessSnackBar(
        //       context: context, message: 'Products Loaded Successfully');
        // }
      },
      builder: (context, state) {
        if (state is GetProductsEmptyState ||
            state is SearchProductsEmptyState) {
          return const EmptyPage(title: 'No Products Found');
        } else if (state is GetProductsLoadingState ||
            state is SearchProductsLoadingState) {
          return Padding(
            padding: EdgeInsets.only(top: 250.h),
            child: CustomCircularLoading(height: 35.h, width: 35.w),
          );
        } else if (state is GetProductsFailureState ||
            state is SearchProductsFailureState) {
          return const CustomText(text: 'Server error');
        } else if (state is GetProductsSuccessfullState) {
          return Expanded(
            child: MasonryGridView.count(
              itemCount: state.allProductslist.length,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final item = state.allProductslist[index];
                return ProductItem(item: item);
              },
            ),
          );
        } else if (state is SearchProductsSuccessfullState) {
          return Expanded(
            child: MasonryGridView.count(
              itemCount: state.productslist.length,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final item = state.productslist[index];
                return ProductItem(item: item);
              },
            ),
          );
        }
        return Padding(
          padding: EdgeInsets.only(top: 280.h),
          child: CustomCircularLoading(height: 35.h, width: 35.w),
        );
      },
    );
  }
}

/**
 
: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is SearchProductsEmptyState) {
                return CustomText(text: state.emptyMsg);
              } else if (state is SearchProductsLoadingState) {
                return CustomCircularLoading(height: 35.h, width: 35.w);
              } else if (state is SearchProductsFailureState) {
                return CustomText(text: state.failMsg);
              } else if (state is SearchProductsSuccessfullState) {
                return Expanded(
                  child: MasonryGridView.count(
                    itemCount: state.productslist.length,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      final item = state.productslist[index];
                      return Container(
                        height: 224.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150.h,
                              decoration: BoxDecoration(
                                color: AppColor.kBackGround,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //^ mark photo
                                  SizedBox(
                                    height: 40.h,
                                    child: item.markPhoto!.isNotEmpty
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.h, left: 10),
                                            child: Image.network(
                                              item.markPhoto!,
                                              height: 40.h,
                                              width: 40.w,
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.h, left: 10),
                                            child: const CustomText(
                                              text: 'No Photo',
                                              color: AppColor.kred,
                                              fontSize: 12,
                                            ),
                                          ),
                                  ),
                                  //^ product photo
                                  Center(
                                    child: SizedBox(
                                      child: item.photo!.isNotEmpty
                                          ? Image.network(item.photo!)
                                          : Padding(
                                              padding:
                                                  EdgeInsets.only(top: 25.h),
                                              child: const CustomText(
                                                text: 'No Photo',
                                                color: AppColor.kred,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //^ product title
                            Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: CustomText(
                                text: item.title!,
                                color: AppColor.kBlack,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                textOverflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            //^ row of rating & reviews number
                            Row(
                              children: [
                                //^ star of rating
                                RatingBar.builder(
                                  initialRating: item.reviewss[0].rate,
                                  minRating: 1,
                                  itemSize: 20,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 1,
                                  itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber),
                                  onRatingUpdate: (rating) {
                                    rating = item.reviewss[0].rate;
                                  },
                                ),
                                //^ rating number
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: CustomText(
                                    text: item.reviewss[0].rate.toString(),
                                    color: AppColor.kBlack,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 11,
                                  ),
                                ),
                                //^ number of reviews
                                CustomText(
                                  text:
                                      '(${item.reviewss.length.toString()} Reviews)',
                                  color: AppColor.kGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                              ],
                            ),
                            //^ price
                            CustomText(
                              text: '\$${item.price.toStringAsFixed(2)}',
                              color: AppColor.kBlack,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              return Padding(
                padding: EdgeInsets.only(top: 280.h),
                child: CustomCircularLoading(height: 35.h, width: 35.w),
              );
            },
          )

 */