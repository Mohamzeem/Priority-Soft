import 'package:dartz/dartz.dart';
import 'package:priority_soft/Core/models/product_model.dart';

abstract class ProductsRepo {
  Future<Either<String, List<ProductModel>>> getProducts();
}
