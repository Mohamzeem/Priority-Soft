// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Features/Discover/presentation/view/widgets/categories_list.dart';
import 'package:priority_soft/Features/Discover/presentation/view/widgets/discover_bar.dart';
import 'package:priority_soft/Features/Discover/presentation/view/widgets/products_list.dart';

class DiscoverBody extends StatelessWidget {
  const DiscoverBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          //^ title
          const DiscoverBar(),
          SizedBox(height: 10.h),
          //^ categories horizontal list
          const CategoriesList(),
          //^ prodcuts vertical list
          const ProductsList(),
        ],
      ),
    ));
  }
}
