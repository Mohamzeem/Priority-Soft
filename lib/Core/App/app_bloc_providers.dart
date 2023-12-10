import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:priority_soft/Core/App/app_injector.dart';
import 'package:priority_soft/Features/Discover/data/categories_repo/categories_repo_impl.dart';
import 'package:priority_soft/Features/Discover/data/products_repo/products_repo_impl.dart';
import 'package:priority_soft/Features/Discover/presentation/view_model/categories_cubit/categories_cubit.dart';
import 'package:priority_soft/Features/Discover/presentation/view_model/products_cubit/products_cubit.dart';

class AppBlocProviders {
  static get allBlocProvider => [
        BlocProvider(
          create: (context) =>
              ProductsCubit(repoImpl: AppInjector().sl.get<ProductsRepoImpl>()),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit(
              repoImpl: AppInjector().sl.get<CategoriesRepoImpl>()),
        )
      ];
}
