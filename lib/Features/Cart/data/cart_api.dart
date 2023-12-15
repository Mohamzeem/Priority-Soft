import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:priority_soft/Core/Utils/app_strings.dart';
import 'package:priority_soft/Core/models/cart_item_model.dart';

class CartApi {
  final fireStore = FirebaseFirestore.instance;

//^ fetch cart items
  Future<List<CartItemModel>> getCarts() async {
    final snapshots =
        await fireStore.collection(AppStrings.cartCollection).get();
    final data =
        snapshots.docs.map((e) => CartItemModel.fromJson(e.data())).toList();
    // print(data[2].title);
    return data;
  }

  //^ delete cart
  Future<void> deleteCart({
    required String id,
  }) async {
    await fireStore.collection(AppStrings.cartCollection).doc(id).delete();
  }
}
