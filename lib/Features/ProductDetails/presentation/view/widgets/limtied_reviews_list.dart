import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Extensions/convert_to_string.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_cashed_image.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/models/product_model.dart';

class LimitedReviewsList extends StatelessWidget {
  final ProductModel item;
  const LimitedReviewsList({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      itemCount: item.reviewss.length >= 3 ? 3 : item.reviewss.length,
      itemBuilder: (context, index) {
        final review = item.reviewss[item.reviewss.length - 3 + index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //^ review photo
                  CustomCashedImage(
                    imageUrl: review.photo!,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //^ review name
                      CustomText(
                        text: review.name!,
                        color: AppColor.kBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        maxLines: 3,
                      ),

                      //^ star of rating
                      RatingBar.builder(
                        initialRating: review.rate,
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
                    ],
                  ),
                  const Spacer(),
                  //^ review created time
                  CustomText(
                    text: DateTime.parse(review.createdAt!)
                        .timeAgo(numericDates: true),
                    color: AppColor.kGray,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    maxLines: 3,
                  ),
                ],
              ),
              //^ review comment
              Padding(
                padding: EdgeInsets.only(top: 5.h, left: 50.w),
                child: CustomText(
                  text: review.comment!,
                  color: AppColor.kBlack,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
