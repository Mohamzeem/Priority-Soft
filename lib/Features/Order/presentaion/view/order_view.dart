// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:priority_soft/Core/App/app_injector.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_appbar.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/models/cart_item_model.dart';
import 'package:priority_soft/Features/Cart/data/cart_repo_impl.dart';
import 'package:priority_soft/Features/Cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class OrderView extends StatelessWidget {
  const OrderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartCubit(repoImpl: AppInjector().sl.get<CartRepoImpl>()),
      child: const Scaffold(
        appBar: CustomAppBar(
          suffix: SizedBox.shrink(),
          title: 'Order Summary',
        ),
        body: SafeArea(child: OrderBody()),
      ),
    );
  }
}

class OrderBody extends StatelessWidget {
  const OrderBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //^ information text
          Padding(
            padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
            child: const CustomText(
              text: 'Information',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColor.kBlack,
            ),
          ),
          //^ payment
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Payment Method',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kBlack,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const CustomText(
                    text: 'Credit Card',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kGray,
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: AppColor.kGray,
              )
            ],
          ),
          Divider(height: 30.h),
          //^ Location
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: 'Location',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kBlack,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const CustomText(
                    text: 'Semarang, Indonesia',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kGray,
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: AppColor.kGray,
              )
            ],
          ),
          const SizedBox(height: 20),
          const CustomText(
            text: 'Order Detail',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColor.kBlack,
          ),
          const OrderList()
        ],
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return const Column(
                children: [
                  CustomText(
                    text: 'Order Detail',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColor.kBlack,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'Order Detail',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColor.kBlack,
                      ),
                      CustomText(
                        text: 'Order Detail',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColor.kBlack,
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
