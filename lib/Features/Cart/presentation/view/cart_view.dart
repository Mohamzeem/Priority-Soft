import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_soft/Core/App/app_injector.dart';
import 'package:priority_soft/Core/Routes/routes.dart';
import 'package:priority_soft/Core/Widgets/custom_appbar.dart';
import 'package:priority_soft/Features/Cart/data/cart_repo_impl.dart';
import 'package:priority_soft/Features/Cart/presentation/view/widgets/cart_body.dart';
import 'package:priority_soft/Features/Cart/presentation/view_model/cart_cubit/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartCubit(repoImpl: AppInjector().sl.get<CartRepoImpl>()),
      child: Scaffold(
        appBar: CustomAppBar(
          suffix: const SizedBox.shrink(),
          title: 'Cart',
          onTap: () => GoRouter.of(context).goNamed(AppRoutes.discoverView),
        ),
        body: const SafeArea(
          child: CartBody(),
        ),
      ),
    );
  }
}
