import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_assets.dart';
import 'package:priority_soft/Core/Widgets/custom_appbar.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/ProductDetails/presentation/view/widgets/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModel item;
  const ProductDetailsView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        suffix: Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Image.asset(
            AppAssets.cart,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: SafeArea(child: ProductDetailsBody(item: item)),
    );
  }
}
