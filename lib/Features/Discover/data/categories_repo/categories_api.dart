import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:priority_soft/Core/Utils/app_strings.dart';
import 'package:priority_soft/Core/models/categories_model.dart';
import 'package:priority_soft/Core/models/product_model.dart';

class CategoriesApi {
  final fireStore = FirebaseFirestore.instance;

  //^ fetch categories
  Future<List<CategoriesModel>> getcategories() async {
    final snapshots = await fireStore
        .collection(AppStrings.categoriesCollection)
        .orderBy('id', descending: false)
        .get();
    final data =
        snapshots.docs.map((e) => CategoriesModel.fromJson(e.data())).toList();
    // print(data[0].title);
    return data;
  }

  //^ filter products by mark or category
  Future<List<ProductModel>> searchProductsByMark(
      {required String mark}) async {
    final snapshots = await fireStore
        .collection(AppStrings.productsCollection)
        .where('mark', isEqualTo: mark)
        .get();
    final data =
        snapshots.docs.map((e) => ProductModel.fromJson(e.data())).toList();
    // print(data.length);
    return data;
  }
}
