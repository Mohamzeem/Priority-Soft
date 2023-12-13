import 'package:equatable/equatable.dart';

class ProductReviewsModel extends Equatable {
  final String? name;
  final String? photo;
  final String? comment;
  final dynamic rate;
  final String? createdAt;

  const ProductReviewsModel({
    this.name,
    this.photo,
    this.comment,
    this.rate,
    this.createdAt,
  });

  factory ProductReviewsModel.fromJson(Map<String, dynamic> json) {
    return ProductReviewsModel(
      name: json['name'] ?? "",
      photo: json['photo'] ?? "",
      comment: json['comment'] ?? "",
      rate: json['rate'] ?? "",
      createdAt: json['createdAt'] ?? "",
    );
  }
  @override
  List<Object> get props => [name!, photo!, comment!, rate!, createdAt!];
}
