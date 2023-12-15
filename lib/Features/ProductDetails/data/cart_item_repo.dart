import 'package:dartz/dartz.dart';

abstract class CartItemRepo {
  Future<Either<String, Unit>> addItemToCart({
    required String title,
    required dynamic price,
    required String createdAt,
    required String id,
    required String photo,
    required String mark,
    required String color,
    required String size,
    required int number,
  });
}
