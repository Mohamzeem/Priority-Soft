import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_soft/Core/Routes/routes.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_button.dart';
import 'package:priority_soft/Core/Widgets/custom_circular_loading.dart';
import 'package:priority_soft/Core/Widgets/custom_snack_bar.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/Widgets/empty_image.dart';
import 'package:priority_soft/Features/Cart/presentation/view/widgets/cart_item.dart';
import 'package:priority_soft/Features/Cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class CartBody extends StatefulWidget {
  const CartBody({
    super.key,
  });

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CartCubit>(context).getCarts();
    BlocProvider.of<CartCubit>(context)
        .sumPrices(BlocProvider.of<CartCubit>(context).list);
    BlocProvider.of<CartCubit>(context).totalPrice;
  }

  double? totalPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            if (state is DeleteCartSuccessState) {
              return CustomSnackBar().showSuccessSnackBar(
                  context: context, message: "Product deleted successfully");
            } else {}
          },
          builder: (context, state) {
            if (state is GetCartLoadingState) {
              return Padding(
                padding: EdgeInsets.only(top: 250.h),
                child: CustomCircularLoading(height: 35.h, width: 35.w),
              );
            } else if (state is GetCartEmptyState) {
              return const EmptyPage(title: 'No Items in cart');
            } else if (state is GetCartSuccessfullState) {
              // var price = BlocProvider.of<CartCubit>(context)
              //     .sumPrices(state.allCartlist);
              // totalPrice = price;
              //  print('PP = $totalPrice');
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: ListView.builder(
                    itemCount: state.allCartlist.length,
                    itemBuilder: (context, index) {
                      final item = state.allCartlist[index];
                      return CartItem(
                        item: item,
                        onDelete: () {
                          BlocProvider.of<CartCubit>(context)
                              .deleteGrowModel(id: item.id!);
                          GoRouter.of(context).pop();
                        },
                      );
                    },
                  ),
                ),
              );
            }
            return Padding(
              padding: EdgeInsets.only(top: 280.h),
              child: CustomCircularLoading(height: 35.h, width: 35.w),
            );
          },
        ),
        //^ price & add to cart button
        Container(
          height: 90.w,
          decoration: BoxDecoration(
            color: AppColor.kWhite,
            boxShadow: [
              BoxShadow(
                blurRadius: 30,
                color: AppColor.kSecWhite.withOpacity(0.2),
              ),
            ],
          ),
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
                    //^ price text
                    const CustomText(
                      text: 'Grand Total',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColor.kGray,
                    ),
                    //^ price value
                    CustomText(
                      text: totalPrice.toString(),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.kBlack,
                    ),
                  ],
                ),
                //^ Check out button
                CustomButton(
                  onPressed: () {
                    GoRouter.of(context).pushNamed(AppRoutes.orderView);
                  },
                  text: 'Check out',
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
}
