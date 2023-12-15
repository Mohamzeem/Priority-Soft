import 'package:dartz/dartz.dart';
import 'package:priority_soft/Core/models/cart_item_model.dart';

abstract class CartRepo {
  Future<Either<String, List<CartItemModel>>> getCarts();
  Future<Either<String, Unit>> deleteCart({required String id});
}
