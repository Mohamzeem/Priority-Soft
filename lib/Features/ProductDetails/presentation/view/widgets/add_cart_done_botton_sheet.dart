import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_soft/Core/App/app_injector.dart';
import 'package:priority_soft/Core/Routes/routes.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_button.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Features/ProductDetails/data/cart_item_repo_impl.dart';
import 'package:priority_soft/Features/ProductDetails/presentation/view_model/cart_item_cubit/cart_item_cubit.dart';

class AddCartDoneBottonSheetBody extends StatelessWidget {
  final String number;
  const AddCartDoneBottonSheetBody({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartItemCubit(repoImpl: AppInjector().sl.get<CartItemRepoImpl>()),
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              //^ check circle
              Container(
                margin: EdgeInsets.only(top: 35.h, bottom: 20),
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: AppColor.kBlack,
                  ),
                ),
                child: const Icon(
                  Icons.check,
                  size: 50,
                  color: AppColor.kGray,
                ),
              ),
              //^ add to cart
              const CustomText(
                text: 'Added to cart',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColor.kBlack,
              ),
              const SizedBox(height: 10.0),
              //^ item number
              CustomText(
                text: '$number Item Total',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.kGray,
              ),
              //^ two buttons row
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      text: 'Back Explore',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      textColor: AppColor.kBlack,
                      width: 156,
                      height: 50,
                      backgroundColor: AppColor.kWhite,
                      threeRadius: 30,
                      lastRadius: 30,
                    ),
                    CustomButton(
                      onPressed: () {
                        GoRouter.of(context).pushNamed(AppRoutes.cartView);
                      },
                      text: 'To Cart',
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
              SizedBox(height: 15.h)
            ],
          ),
        ),
      ),
    );
  }
}
