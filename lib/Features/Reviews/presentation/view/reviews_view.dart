import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/App/app_injector.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_appbar.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/Reviews/data/stars_repo_impl.dart';
import 'package:priority_soft/Features/Reviews/presentation/view/widgets/reviews_body.dart';
import 'package:priority_soft/Features/Reviews/presentation/view_model/stars_cubit/stars_cubit.dart';

class ReviewsView extends StatelessWidget {
  final ProductModel item;
  const ReviewsView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          StarsCubit(repoImpl: AppInjector().sl.get<StarsRepoImpl>()),
      child: Scaffold(
        //^ appbar
        appBar: CustomAppBar(
          title: 'Review (${item.reviewss.length})',
          //^ suffix icon of rating & reviews number
          suffix: Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: InkWell(
              onTap: () {
                BlocProvider.of<StarsCubit>(context).getStars();
              },
              child: Row(
                children: [
                  //^ star of rating
                  RatingBar.builder(
                    initialRating: item.reviewss[0].rate,
                    minRating: 1,
                    itemSize: 25,
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
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: ReviewsBody(
          item: item,
        )),
      ),
    );
  }
}
