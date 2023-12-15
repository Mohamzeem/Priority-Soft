import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:priority_soft/Core/models/cart_item_model.dart';
import 'package:priority_soft/Features/Cart/data/cart_api.dart';
import 'package:priority_soft/Features/Cart/data/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartApi api;
  CartRepoImpl({required this.api});

  @override
  Future<Either<String, List<CartItemModel>>> getCarts() async {
    try {
      final result = await api.getCarts();
      return right(result);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }

  @override
  Future<Either<String, Unit>> deleteCart({required String id}) async {
    try {
      await api.deleteCart(id: id);
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }
}
