import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:priority_soft/Core/Utils/app_strings.dart';
import 'package:priority_soft/Core/models/cart_item_model.dart';

class CartItemApi {
  final fireStore = FirebaseFirestore.instance;

  Future addItemToCart({
    required String title,
    required dynamic price,
    required String createdAt,
    required String id,
    required String photo,
    required String mark,
    required String color,
    required String size,
    required int number,
  }) async {
    var model = CartItemModel(
      title: title,
      price: price,
      createdAt: createdAt,
      id: id,
      photo: photo,
      mark: mark,
      color: color,
      size: size,
      number: number,
    );
    await fireStore
        .collection(AppStrings.cartCollection)
        .doc(id)
        .set(model.toJson());
  }
}
