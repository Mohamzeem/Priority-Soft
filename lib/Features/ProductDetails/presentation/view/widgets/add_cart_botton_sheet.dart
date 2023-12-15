import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_soft/Core/App/app_injector.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_button.dart';
import 'package:priority_soft/Core/Widgets/custom_snack_bar.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/ProductDetails/data/cart_item_repo_impl.dart';
import 'package:priority_soft/Features/ProductDetails/presentation/view/widgets/add_cart_done_botton_sheet.dart';
import 'package:priority_soft/Features/ProductDetails/presentation/view_model/cart_item_cubit/cart_item_cubit.dart';

class AddCartBottonSheetBody extends StatefulWidget {
  final ProductModel item;
  const AddCartBottonSheetBody({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<AddCartBottonSheetBody> createState() => _BottonSheetBodyState();
}

class _BottonSheetBodyState extends State<AddCartBottonSheetBody> {
  void _increment() {
    int currentValue = int.tryParse(cartController.text) ?? 0;
    int newValue = currentValue + 1;
    cartController.text = newValue.toString();
  }

  void _decrement() {
    int currentValue = int.tryParse(cartController.text) ?? 0;
    int newValue = currentValue - 1;
    if (newValue >= 1) {
      cartController.text = newValue.toString();
    }
  }

  @override
  void dispose() {
    cartController.dispose();
    super.dispose();
  }

  final cartController = TextEditingController(text: '1');
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //^ add to cart text & close button
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(
                      text: 'Add to cart',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.kBlack,
                    ),
                    InkWell(
                      onTap: () => GoRouter.of(context).pop(),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.close, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
              //^ quantity
              const CustomText(
                text: 'Quantity',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColor.kBlack,
              ),
              const SizedBox(height: 15.0),
              //^ quantity field
              TextFormField(
                controller: cartController,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                    color: AppColor.kBlack,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
                decoration: InputDecoration(
                  suffixIcon: SizedBox(
                    width: 70,
                    child: Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _decrement();
                            });
                          },
                          child: const Icon(
                            Icons.remove_circle_outline_outlined,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        InkWell(
                          onTap: () => setState(() => _increment()),
                          child: const Icon(
                            Icons.add_circle_outline_outlined,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.kBlack,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.kBlack,
                    ),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.kBlack,
                    ),
                  ),
                ),
              ),
              //^ price & addc to cart row
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: 'Total Price',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.kGray,
                        ),
                        CustomText(
                          text: '\$${widget.item.price!.toString()}',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColor.kBlack,
                        ),
                      ],
                    ),
                    BlocConsumer<CartItemCubit, CartItemState>(
                      listener: (context, state) {
                        if (state is AddCartItemSuccessState) {
                          GoRouter.of(context).pop();
                          modelSheet(context,
                              widget: AddCartDoneBottonSheetBody(
                                  number: cartController.text));
                        } else if (state is AddCartItemFailureState) {
                          CustomSnackBar().showErrorSnackBar(
                              context: context, message: 'Product Not added');
                        }
                      },
                      builder: (context, state) {
                        return CustomButton(
                          onPressed: () {
                            BlocProvider.of<CartItemCubit>(context)
                                .addItemToCart(
                              title: widget.item.title!,
                              price: widget.item.price,
                              photo: widget.item.photo!,
                              mark: widget.item.mark!,
                              color: '0xFF2539E9',
                              size: '40.0',
                              number: int.parse(cartController.text),
                            );
                          },
                          text: 'ADD TO CART',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          textColor: AppColor.kWhite,
                          width: 156,
                          height: 50,
                          backgroundColor: AppColor.kBlack,
                          threeRadius: 30,
                          lastRadius: 30,
                        );
                      },
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

//* showModalBottomSheet
  Future modelSheet(BuildContext context, {required Widget widget}) async {
    return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
}
