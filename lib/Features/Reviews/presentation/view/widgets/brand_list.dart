import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/Widgets/custom_circular_loading.dart';
import 'package:priority_soft/Core/Widgets/custom_text.dart';
import 'package:priority_soft/Features/Reviews/presentation/view_model/stars_cubit/stars_cubit.dart';

class StarsList extends StatefulWidget {
  const StarsList({super.key});

  @override
  State<StarsList> createState() => _StarsListState();
}

class _StarsListState extends State<StarsList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StarsCubit>(context).getStars();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      height: 50.h,
      child: BlocBuilder<StarsCubit, StarsState>(
        builder: (context, state) {
          if (state is GetStarsLoadingState) {
            return CustomCircularLoading(height: 25.h, width: 25.w);
          } else if (state is GetStarsFailureState) {
            return CustomText(text: state.failMsg);
          } else if (state is GetStarsSuccessfullState) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.starslist.length,
              itemBuilder: (context, index) {
                final star = state.starslist[index];
                return Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: CustomText(
                      text: star.title!,
                      color: currentIndex == index
                          ? AppColor.kBlack
                          : AppColor.kGray,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
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
