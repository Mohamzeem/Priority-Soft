import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PriceSlider extends StatefulWidget {
  const PriceSlider({super.key});

  @override
  State<PriceSlider> createState() => _PriceSliderState();
}

class _PriceSliderState extends State<PriceSlider> {
  SfRangeValues _currentRangeValues = const SfRangeValues(600.0, 1300.0);

  @override
  Widget build(BuildContext context) {
    return SfRangeSlider(
      min: 0,
      max: 1750,
      activeColor: AppColor.kBlack,
      inactiveColor: AppColor.kBackGround,
      showLabels: true,
      enableTooltip: true,
      showDividers: true,
      numberFormat: NumberFormat('\$'),
      shouldAlwaysShowTooltip: true,
      values: _currentRangeValues,
      onChanged: (SfRangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }
}
