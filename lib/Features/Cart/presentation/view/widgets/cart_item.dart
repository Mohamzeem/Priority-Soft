import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_assets.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_cashed_image.dart';
import 'package:priority_soft/Core/Widgets/custom_dialog.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Core/models/cart_item_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:priority_soft/Features/Cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class CartItem extends StatefulWidget {
  final CartItemModel item;
  final void Function() onDelete;
  const CartItem({
    super.key,
    required this.item,
    required this.onDelete,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int currentNumber = 0;
  @override
  void initState() {
    super.initState();
    currentNumber = widget.item.number!;
  }

  void _increment() {
    currentNumber++;
  }

  void _decrement() {
    setState(() {
      if (currentNumber > 1) {
        currentNumber--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            //~ on click on slide delete button show dialog
            onPressed: (context) {
              CustomDialog().twoButtonDialog(
                context: context,
                textBody: 'Are You Sure',
                textButton: 'Yes',
                onPressed: widget.onDelete,
              );
            },
            backgroundColor: AppColor.kred,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(20),
            label: 'Delete',
            flex: 10,
          ),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //^ product photo
            Container(
              height: 90.h,
              width: 90.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.kBackGround),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: widget.item.photo == null || widget.item.photo!.isEmpty
                    ? Image.asset(AppAssets.blankPhoto)
                    : CustomCashedImage(
                        imageUrl: widget.item.photo!,
                        width: 90,
                        height: 90,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //^ product title
                SizedBox(
                  width: 250,
                  child: CustomText(
                    text: widget.item.title!,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    maxLines: 1,
                    textOverflow: TextOverflow.visible,
                    color: AppColor.kBlack,
                  ),
                ),
                //^ product mark, color, size
                CustomText(
                  text:
                      '${widget.item.mark} . ${widget.item.color} . ${widget.item.size}',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  maxLines: 1,
                  textOverflow: TextOverflow.visible,
                  color: AppColor.kGray,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //^ product price
                    SizedBox(
                      width: 100.w,
                      child: CustomText(
                        text: '\$${widget.item.price.toStringAsFixed(2)}',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        maxLines: 1,
                        textOverflow: TextOverflow.visible,
                        color: AppColor.kBlack,
                      ),
                    ),
                    // SizedBox(width: 120.w),
                    //^ add and remove number of products
                    SizedBox(
                      width: 150,
                      child: Row(
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () => setState(() => _decrement()),
                            child: Icon(
                              Icons.remove_circle_outline_outlined,
                              size: 25,
                              color: currentNumber == 1
                                  ? AppColor.kGray
                                  : AppColor.kBlack,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                            child: Center(
                              child: CustomText(
                                text: currentNumber.toString(),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                maxLines: 1,
                                textOverflow: TextOverflow.visible,
                                color: AppColor.kBlack,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => setState(() => _increment()),
                            child: const Icon(
                              Icons.add_circle_outline_outlined,
                              size: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
