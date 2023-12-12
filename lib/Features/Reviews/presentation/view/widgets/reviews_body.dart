import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/Reviews/presentation/view/widgets/all_reviews_list.dart';
import 'package:priority_soft/Features/Reviews/presentation/view/widgets/brand_list.dart';

class ReviewsBody extends StatelessWidget {
  final ProductModel item;
  const ReviewsBody({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const BrandList(),
            AllReviewsList(item: item),
          ],
        ),
      ),
    );
  }
}
