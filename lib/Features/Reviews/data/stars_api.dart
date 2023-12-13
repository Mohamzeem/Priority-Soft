import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:priority_soft/Core/Utils/app_strings.dart';
import 'package:priority_soft/Core/models/stars_model.dart';

class StarsApi {
  final fireStore = FirebaseFirestore.instance;

  //^ fetch brands
  Future<List<StarsModel>> getStars() async {
    final snapshots = await fireStore
        .collection(AppStrings.starsCollection)
        .orderBy('title', descending: true)
        .get();
    final data =
        snapshots.docs.map((e) => StarsModel.fromJson(e.data())).toList();
    // print(data[4].title);
    return data;
  }
}
