import 'package:equatable/equatable.dart';
import 'package:priority_soft/Features/Discover/data/models/reviews_model.dart';

class ProductModel extends Equatable {
  final String? title;
  final String? description;
  final String? id;
  final String? photo;
  final String? mark;
  final String? markPhoto;
  final dynamic price;
  final List<ReviewModel> reviewss;
  const ProductModel({
    this.title,
    this.description,
    this.id,
    this.photo,
    this.mark,
    this.markPhoto,
    this.price,
    required this.reviewss,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    List<ReviewModel> reviews = [];
    if (map['reviewss'] != null) {
      var reviewsList = map['reviewss'] as List<dynamic>;
      reviews =
          reviewsList.map((review) => ReviewModel.fromJson(review)).toList();
    }

    return ProductModel(
      title: map['title'] != null ? map['title'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      mark: map['mark'] != null ? map['mark'] as String : null,
      markPhoto: map['markPhoto'] != null ? map['markPhoto'] as String : null,
      price: map['price'] as dynamic,
      reviewss: reviews,
    );
  }

  @override
  List<Object> get props {
    return [
      title!,
      description!,
      id!,
      photo!,
      mark!,
      markPhoto!,
      price,
      reviewss
    ];
  }
}
