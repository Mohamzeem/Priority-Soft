import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String? title;
  final String? photo;

  const CategoriesModel({
    this.title,
    this.photo,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      title: json['title'] != null ? json['title'] as String : null,
      photo: json['photo'] != null ? json['photo'] as String : null,
    );
  }
  @override
  List<Object> get props => [title!, photo!];
}
