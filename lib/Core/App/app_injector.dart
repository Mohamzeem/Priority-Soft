import 'package:get_it/get_it.dart';
import 'package:priority_soft/Features/Cart/data/cart_api.dart';
import 'package:priority_soft/Features/Cart/data/cart_repo_impl.dart';
import 'package:priority_soft/Features/Discover/data/categories_repo/categories_api.dart';
import 'package:priority_soft/Features/Discover/data/categories_repo/categories_repo_impl.dart';
import 'package:priority_soft/Features/Discover/data/products_repo/products_api.dart';
import 'package:priority_soft/Features/Discover/data/products_repo/products_repo_impl.dart';
import 'package:priority_soft/Features/ProductDetails/data/cart_item_api.dart';
import 'package:priority_soft/Features/ProductDetails/data/cart_item_repo_impl.dart';
import 'package:priority_soft/Features/Reviews/data/stars_api.dart';
import 'package:priority_soft/Features/Reviews/data/stars_repo_impl.dart';

class AppInjector {
  final sl = GetIt.instance;

  Future<void> setInjector() async {
    //^ products
    sl.registerLazySingleton<ProductsApi>(() => ProductsApi());
    sl.registerLazySingleton<ProductsRepoImpl>(
      () => ProductsRepoImpl(api: sl()),
    );

    //^ categories
    sl.registerLazySingleton<CategoriesApi>(() => CategoriesApi());
    sl.registerLazySingleton<CategoriesRepoImpl>(
      () => CategoriesRepoImpl(api: sl()),
    );

    //^ Stars
    sl.registerLazySingleton<StarsApi>(() => StarsApi());
    sl.registerLazySingleton<StarsRepoImpl>(
      () => StarsRepoImpl(api: sl()),
    );

    //^ cart item
    sl.registerLazySingleton<CartItemApi>(() => CartItemApi());
    sl.registerLazySingleton<CartItemRepoImpl>(
      () => CartItemRepoImpl(api: sl()),
    );

    //^ cart
    sl.registerLazySingleton<CartApi>(() => CartApi());
    sl.registerLazySingleton<CartRepoImpl>(
      () => CartRepoImpl(api: sl()),
    );
  }
}
