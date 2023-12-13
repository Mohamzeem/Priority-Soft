import 'package:equatable/equatable.dart';

class ProductColorsModel extends Equatable {
  final String? color;

  const ProductColorsModel({
    this.color,
  });

  factory ProductColorsModel.fromJson(Map<String, dynamic> json) {
    return ProductColorsModel(
      color: json['color'] ?? "",
    );
  }

  factory ProductColorsModel.fromColor(String color) {
    return ProductColorsModel(color: color);
  }
  @override
  List<Object> get props => [color!];
}
