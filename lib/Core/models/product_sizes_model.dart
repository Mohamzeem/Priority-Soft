import 'package:equatable/equatable.dart';

class ProductSizesModel extends Equatable {
  final String? size;

  const ProductSizesModel({
    this.size,
  });

  factory ProductSizesModel.fromJson(Map<String, dynamic> json) {
    return ProductSizesModel(
      size: json['size'] ?? "",
    );
  }
  factory ProductSizesModel.fromSize(String size) {
    return ProductSizesModel(size: size);
  }
  @override
  List<Object> get props => [size!];
}
