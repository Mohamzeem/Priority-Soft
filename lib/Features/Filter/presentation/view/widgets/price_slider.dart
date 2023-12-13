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
  SfRangeValues _currentRangeValues = const SfRangeValues(600, 1300);

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


/**
 RangeSlider(
      activeColor: AppColor.kBlack,
      inactiveColor: AppColor.kBackGround,
      max: 1750,
      divisions: 1750,
      values: _currentRangeValues,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
 */