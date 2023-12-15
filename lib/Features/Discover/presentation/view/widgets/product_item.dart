import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_soft/Core/Routes/routes.dart';
import 'package:priority_soft/Core/Utils/app_assets.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_cashed_image.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel item;
  const ProductItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context)
          .pushNamed(AppRoutes.productDetailsView, extra: item),
      child: Container(
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
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h, left: 10),
                      child: item.markPhoto == null || item.markPhoto!.isEmpty
                          ? Image.asset(AppAssets.blankPhoto)
                          : CustomCashedImage(
                              imageUrl: item.markPhoto!,
                              width: 40,
                              height: 40,
                            ),
                    ),
                  ),
                  //^ product photo
                  Center(
                    child: SizedBox(
                      child: item.photo == null || item.photo!.isEmpty
                          ? Image.asset(AppAssets.blankPhoto, height: 100)
                          : CustomCashedImage(
                              imageUrl: item.photo!,
                              width: 110,
                              height: 110,
                              fit: BoxFit.contain,
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
                  initialRating: 2.5,
                  minRating: 1,
                  itemSize: 20,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 1,
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    rating = item.sumOfRates();
                  },
                ),
                //^ rating number
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: CustomText(
                    text: item.sumOfRates().toStringAsFixed(1),
                    color: AppColor.kBlack,
                    fontWeight: FontWeight.w700,
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
            //^ price
            CustomText(
              text: '\$${item.price.toStringAsFixed(2)}',
              color: AppColor.kBlack,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
