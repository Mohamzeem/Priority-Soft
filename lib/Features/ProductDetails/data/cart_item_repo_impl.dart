import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:priority_soft/Features/ProductDetails/data/cart_item_api.dart';
import 'package:priority_soft/Features/ProductDetails/data/cart_item_repo.dart';

class CartItemRepoImpl implements CartItemRepo {
  final CartItemApi api;
  CartItemRepoImpl({required this.api});
  @override
  Future<Either<String, Unit>> addItemToCart(
      {required String title,
      required price,
      required String createdAt,
      required String id,
      required String photo,
      required String mark,
      required String color,
      required String size,
      required int number}) async {
    try {
      await api.addItemToCart(
          title: title,
          price: price,
          createdAt: createdAt,
          id: id,
          photo: photo,
          mark: mark,
          color: color,
          size: size,
          number: number);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }
}
