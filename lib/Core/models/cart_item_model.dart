import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  final String? title;
  final String? createdAt;
  final String? id;
  final String? photo;
  final String? mark;
  final String? color;
  final String? size;
  final int? number;
  final dynamic price;
  const CartItemModel({
    this.title,
    this.createdAt,
    this.id,
    this.photo,
    this.mark,
    this.color,
    this.size,
    this.number,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'createdAt': createdAt,
      'id': id,
      'photo': photo,
      'mark': mark,
      'color': color,
      'size': size,
      'number': number,
      'price': price,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      title: json['title'] != null ? json['title'] as String : null,
      createdAt: json['createdAt'] != null ? json['createdAt'] as String : null,
      id: json['id'] != null ? json['id'] as String : null,
      photo: json['photo'] != null ? json['photo'] as String : null,
      mark: json['mark'] != null ? json['mark'] as String : null,
      color: json['color'] != null ? json['color'] as String : null,
      size: json['size'] != null ? json['size'] as String : null,
      number: json['number'] != null ? json['number'] as int : null,
      price: json['price'] as dynamic,
    );
  }

  @override
  List<Object> get props {
    return [
      title!,
      createdAt!,
      id!,
      photo!,
      mark!,
      color!,
      size!,
      number!,
      price,
    ];
  }
}
