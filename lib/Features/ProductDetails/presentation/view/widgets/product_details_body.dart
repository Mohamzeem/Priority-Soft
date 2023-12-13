// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:priority_soft/Core/Routes/routes.dart';
import 'package:priority_soft/Core/Utils/app_assets.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_button.dart';
import 'package:priority_soft/Core/Widgets/custom_cashed_image.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/ProductDetails/presentation/view/widgets/limtied_reviews_list.dart';
import 'package:priority_soft/Features/ProductDetails/presentation/view/widgets/size_circles.dart';

class ProductDetailsBody extends StatelessWidget {
  final ProductModel item;
  const ProductDetailsBody({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Container(
                      height: 315,
                      decoration: BoxDecoration(
                        color: AppColor.kBackGround,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //^ product photo
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            child: SizedBox(
                              height: 235,
                              width: 280,
                              child: item.photo == null || item.photo!.isEmpty
                                  ? Image.asset(AppAssets.blankPhoto)
                                  : CustomCashedImage(
                                      imageUrl: item.photo!,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.contain,
                                    ),
                            ),
                          ),
                          //^ row of dots and colors
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //^ 3 dots
                              Padding(
                                  padding: EdgeInsets.only(left: 13.w),
                                  child: DotsIndicator(
                                    dotsCount: 3,
                                    decorator: const DotsDecorator(
                                        color: AppColor.kGray,
                                        activeColor: AppColor.kBlack),
                                  )),
                              //^ color pick
                              Image.asset(AppAssets.colorsRow)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  //^ product title
                  CustomText(
                    text: item.title!,
                    color: AppColor.kBlack,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  //^ row of rate and reviews
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                    child: Row(
                      children: [
                        //^ star of rating
                        RatingBar.builder(
                          initialRating: item.reviewss[0].rate,
                          minRating: 1,
                          itemSize: 20,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) =>
                              const Icon(Icons.star, color: Colors.amber),
                          onRatingUpdate: (rating) {
                            rating = item.reviewss[0].rate;
                          },
                        ),
                        //^ rating number
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: CustomText(
                            text: item.reviewss[0].rate.toString(),
                            color: AppColor.kBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          ),
                        ),
                        //^ number of reviews
                        CustomText(
                          text: '(${item.reviewss.length.toString()} Reviews)',
                          color: AppColor.kGray,
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                        ),
                      ],
                    ),
                  ),
                  //^ size text
                  const CustomText(
                    text: 'Size',
                    color: AppColor.kBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  //^ size circles
                  const SizeCircles(),
                  //^ description text
                  const CustomText(
                    text: 'Description',
                    color: AppColor.kBlack,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  //^ the description
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 30.h),
                    child: CustomText(
                      text: item.description!,
                      color: AppColor.kGray,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  //^ reviews text
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      children: [
                        //^ reviews text
                        const CustomText(
                          text: 'Reviews',
                          color: AppColor.kBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        //^ number of reviews
                        Padding(
                          padding: EdgeInsets.only(left: 5.h),
                          child: CustomText(
                            text: '(${item.reviewss.length.toString()})',
                            color: AppColor.kBlack,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //^ reviews List
                  LimitedReviewsList(item: item),
                  //^ see reviews button
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context)
                            .pushNamed(AppRoutes.reviewsView, extra: item);
                      },
                      child: Container(
                        height: 50.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.kWhite,
                          border:
                              Border.all(width: 2, color: AppColor.kBackGround),
                        ),
                        child: const Center(
                          child: CustomText(
                            text: 'See All Review',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColor.kBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        //^ price & add to cart button
        Container(
          height: 90.w,
          decoration: BoxDecoration(color: AppColor.kWhite, boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: AppColor.kSecWhite.withOpacity(0.2),
            ),
          ]),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: 'Price',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.kGray,
                    ),
                    CustomText(
                      text: '\$${item.price!.toString()}',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.kBlack,
                    ),
                  ],
                ),
                CustomButton(
                  onPressed: () {
                    modelSheet(context);
                  },
                  text: 'ADD TO CART',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  textColor: AppColor.kWhite,
                  width: 156,
                  height: 50,
                  backgroundColor: AppColor.kBlack,
                  threeRadius: 30,
                  lastRadius: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

//^ showModalBottomSheet
  Future modelSheet(BuildContext context) async {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return BottonSheetBody(item: item);
      },
    );
  }
}

class BottonSheetBody extends StatelessWidget {
  final ProductModel item;
  const BottonSheetBody({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //^ add to cart
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                    text: 'Add to cart',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kBlack,
                  ),
                  InkWell(
                    onTap: () => GoRouter.of(context).pop(),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //^ quantity
            const CustomText(
              text: 'Quantity',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColor.kBlack,
            ),
            const SizedBox(height: 15.0),
            //^ quantity field
            TextField(
              decoration: InputDecoration(
                  suffixIcon: Row(
                children: [
                  const Spacer(),
                  const Icon(Icons.remove_circle_outline_outlined),
                  SizedBox(width: 8.w),
                  const Icon(Icons.add_circle_outline_outlined)
                ],
              )),
            ),
            //^ price & addc to cart row
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: 'Total Price',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.kGray,
                      ),
                      CustomText(
                        text: '\$${item.price!.toString()}',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColor.kBlack,
                      ),
                    ],
                  ),
                  CustomButton(
                    onPressed: () {
                      // modelSheet(context);
                    },
                    text: 'ADD TO CART',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    textColor: AppColor.kWhite,
                    width: 156,
                    height: 50,
                    backgroundColor: AppColor.kBlack,
                    threeRadius: 30,
                    lastRadius: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
