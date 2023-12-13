import 'package:equatable/equatable.dart';

class CategoriesModel extends Equatable {
  final String? title;
  final String? photo;
  final String? items;
  final int? id;

  const CategoriesModel({this.title, this.photo, this.id, this.items});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      title: json['title'] != null ? json['title'] as String : null,
      photo: json['photo'] != null ? json['photo'] as String : null,
      items: json['items'] != null ? json['items'] as String : null,
      id: json['id'] != null ? json['id'] as int : null,
    );
  }
  @override
  List<Object> get props => [title!, photo!, id!, items!];
}
