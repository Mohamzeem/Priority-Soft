import 'package:priority_soft/Core/Utils/app_colors.dart';
import 'package:priority_soft/Core/models/colors_button_model.dart';
import 'package:priority_soft/Core/models/button_model.dart';

class AppLists {
  static List<ButtonModel> sortedButtons = [
    ButtonModel(
      title: 'Most recent',
      width: 140,
    ),
    ButtonModel(
      title: 'Lowest price',
      width: 145,
    ),
    ButtonModel(
      title: 'Highest price',
      width: 150,
    ),
  ];

  static List<ButtonModel> genderButtons = [
    ButtonModel(
      title: 'Man',
      width: 100,
    ),
    ButtonModel(
      title: 'Women',
      width: 110,
    ),
    ButtonModel(
      title: 'Unisex',
      width: 105,
    ),
  ];

  static List<ColorButtonModel> colorButtons = [
    ColorButtonModel(
      title: 'Black',
      width: 110,
      circleColor: AppColor.kBlack,
    ),
    ColorButtonModel(
      title: 'White',
      width: 120,
      circleColor: AppColor.kWhite,
    ),
    ColorButtonModel(
      title: 'Red',
      width: 100,
      circleColor: AppColor.kred,
    ),
  ];
}
