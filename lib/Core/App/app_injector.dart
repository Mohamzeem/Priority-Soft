import 'package:get_it/get_it.dart';
import 'package:priority_soft/Features/Discover/data/categories_repo/categories_api.dart';
import 'package:priority_soft/Features/Discover/data/categories_repo/categories_repo_impl.dart';
import 'package:priority_soft/Features/Discover/data/products_repo/products_api.dart';
import 'package:priority_soft/Features/Discover/data/products_repo/products_repo_impl.dart';

class AppInjector {
  final sl = GetIt.instance;

  Future<void> setInjector() async {
    //^ prodcuts
    sl.registerLazySingleton<ProductsApi>(() => ProductsApi());
    sl.registerLazySingleton<ProductsRepoImpl>(
      () => ProductsRepoImpl(api: sl()),
    );

    //^ categories
    sl.registerLazySingleton<CategoriesApi>(() => CategoriesApi());
    sl.registerLazySingleton<CategoriesRepoImpl>(
      () => CategoriesRepoImpl(api: sl()),
    );
  }
}
