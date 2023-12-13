import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_circular_loading.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/Discover/presentation/view_model/products_cubit/products_cubit.dart';

class ColorList extends StatefulWidget {
  final ProductModel item;
  const ColorList({Key? key, required this.item}) : super(key: key);

  @override
  State<ColorList> createState() => _ColorListState();
}

class _ColorListState extends State<ColorList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductsCubit>(context).getProducts();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.kWhite,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            blurRadius: 30,
            color: AppColor.kSecWhite.withOpacity(0.2),
          ),
        ],
      ),
      height: 40.h,
      width: 132.w,
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
              // reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.item.colors.length,
              itemBuilder: (context, index) {
                final color = widget.item.colors[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: Center(
                        child: Container(
                          width: 22.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: currentIndex == index
                                  ? AppColor.kBackGround
                                  : Colors.transparent,
                            ),
                            shape: BoxShape.circle,
                            color: Color(int.parse(color.color!)),
                          ),
                          child: Icon(
                            Icons.check,
                            size: 10,
                            color: currentIndex == index
                                ? AppColor.kBackGround
                                : Colors.transparent,
                          ),
                        ),
                      )),
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
