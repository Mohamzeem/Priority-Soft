import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:priority_soft/Core/Utils/app_strings.dart';
import 'package:priority_soft/Core/models/categories_model.dart';

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
}
