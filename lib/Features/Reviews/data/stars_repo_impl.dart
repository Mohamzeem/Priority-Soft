import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:priority_soft/Core/models/stars_model.dart';
import 'package:priority_soft/Features/Reviews/data/stars_api.dart';
import 'package:priority_soft/Features/Reviews/data/stars_repo.dart';

class StarsRepoImpl implements StarsRepo {
  final StarsApi api;
  StarsRepoImpl({required this.api});
  @override
  Future<Either<String, List<StarsModel>>> getStars() async {
    try {
      final result = await api.getStars();
      return right(result);
    } on FirebaseException catch (e) {
      return left(e.code.toString());
    }
  }
}
