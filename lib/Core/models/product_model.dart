import 'package:equatable/equatable.dart';
import 'package:priority_soft/Core/models/product_colors_model.dart';
import 'package:priority_soft/Core/models/product_reviews_model.dart';
import 'package:priority_soft/Core/models/product_sizes_model.dart';

class ProductModel extends Equatable {
  final String? title;
  final String? description;
  final String? id;
  final String? photo;
  final String? mark;
  final String? markPhoto;
  final dynamic price;
  final List<ProductReviewsModel> reviewss;
  final List<ProductColorsModel> colors;
  final List<ProductSizesModel> sizes;
  const ProductModel({
    this.title,
    this.description,
    this.id,
    this.photo,
    this.mark,
    this.markPhoto,
    this.price,
    required this.reviewss,
    required this.colors,
    required this.sizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    List<ProductReviewsModel> reviews = [];
    if (map['reviewss'] != null) {
      var reviewsList = map['reviewss'] as List<dynamic>;
      reviews = reviewsList
          .map((review) => ProductReviewsModel.fromJson(review))
          .toList();
    }
    List<ProductColorsModel> colorss = [];
    if (map['colors'] != null) {
      var colorsList = map['colors'] as List<dynamic>;
      colorss = colorsList.map((color) {
        return ProductColorsModel.fromColor(color);
      }).toList();
    }
    // List<ProductColorsModel> colorss = [];
    // if (map['colors'] != null) {
    //   var colorsList = map['colors'] as List<dynamic>;
    //   colorss = colorsList.map((color) {
    //     if (color is Map<String, dynamic>) {
    //       return ProductColorsModel.fromJson(color);
    //     } else if (color is String) {
    //       // Assuming the color is represented as a string
    //       return ProductColorsModel.fromColor(color);
    //     } else {
    //       // Handle the case where the color data is not a map
    //       return const ProductColorsModel(color: '');
    //     }
    //   }).toList();
    // }

    List<ProductSizesModel> sizess = [];
    if (map['sizes'] != null) {
      var sizesList = map['sizes'] as List<dynamic>;
      sizess = sizesList.map((size) {
        return ProductSizesModel.fromSize(size);
      }).toList();
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
      sizes: sizess,
      colors: colorss,
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
      reviewss,
      colors,
      sizes
    ];
  }
}

// class Kdsds extends Equatable {
//   final List<ProductReviewsModel> reviewss;
//   final List<ProductColorsModel> colors;
//   final List<ProductSizesModel> sizes;
//   const Kdsds({
//     required this.reviewss,
//     required this.colors,
//     required this.sizes,
//   });
//   @override
//   List<Object> get props => [reviewss, colors, sizes];

//   factory Kdsds.fromMap(Map<String, dynamic> map) {
//     return Kdsds(
//       reviewss: List<ProductReviewsModel>.from(
//         (map['reviewss'] as List<int>).map<ProductReviewsModel>(
//           (x) => ProductReviewsModel.fromJson(x as Map<String, dynamic>),
//         ),
//       ),
//       colors: List<ProductColorsModel>.from(
//         (map['colors'] as List<int>).map<ProductColorsModel>(
//           (x) => ProductColorsModel.fromJson(x as Map<String, dynamic>),
//         ),
//       ),
//       sizes: List<ProductSizesModel>.from(
//         (map['sizes'] as List<int>).map<ProductSizesModel>(
//           (x) => ProductSizesModel.fromJson(x as Map<String, dynamic>),
//         ),
//       ),
//     );
//   }
// }
