import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel item;
  const ProductItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          padding: EdgeInsets.only(top: 10.h, left: 10),
                          child: Image.network(
                            item.markPhoto!,
                            height: 40.h,
                            width: 40.w,
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 10.h, left: 10),
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
                            padding: EdgeInsets.only(top: 25.h),
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
    );
  }
}
