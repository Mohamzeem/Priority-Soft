import 'package:equatable/equatable.dart';

class ReviewModel extends Equatable {
  final String? name;
  final String? photo;
  final String? comment;
  final dynamic rate;
  final String? createdAt;

  const ReviewModel({
    this.name,
    this.photo,
    this.comment,
    this.rate,
    this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
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
