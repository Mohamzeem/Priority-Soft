import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_circular_loading.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/Discover/presentation/view_model/products_cubit/products_cubit.dart';
import 'package:priority_soft/Features/ProductDetails/presentation/view/widgets/size_item.dart';

class SizeList extends StatefulWidget {
  final ProductModel item;
  const SizeList({Key? key, required this.item}) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProducts();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is GetProductsEmptyState) {
            return CustomText(text: state.emptyMsg);
          } else if (state is GetProductsLoadingState) {
            return CustomCircularLoading(height: 25.h, width: 25.w);
          } else if (state is GetProductsFailureState) {
            return CustomText(text: state.failMsg);
          } else if (state is GetProductsSuccessfullState) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.item.sizes.length,
              itemBuilder: (context, index) {
                final size = widget.item.sizes[index];
                return Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: SizeItem(
                      text: size.size!,
                      color: currentIndex == index
                          ? AppColor.kWhite
                          : AppColor.kGray,
                      backgroundColor: currentIndex == index
                          ? AppColor.kBlack
                          : AppColor.kWhite,
                    ),
                  ),
                );
              },
            );
          }
          return CustomCircularLoading(height: 25.h, width: 25.w);
        },
      ),
    );
  }
}
