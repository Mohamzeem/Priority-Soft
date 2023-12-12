import 'package:dartz/dartz.dart';
import 'package:priority_soft/Core/models/stars_model.dart';

abstract class StarsRepo {
  Future<Either<String, List<StarsModel>>> getStars();
}
