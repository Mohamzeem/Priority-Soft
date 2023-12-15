import 'package:go_router/go_router.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/Cart/presentation/view/cart_view.dart';
import 'package:priority_soft/Features/Discover/presentation/view/discover_view.dart';
import 'package:priority_soft/Features/Filter/presentation/view/filter_view.dart';
import 'package:priority_soft/Features/Order/presentaion/view/order_view.dart';
import 'package:priority_soft/Features/ProductDetails/presentation/view/product_details_view.dart';
import 'package:priority_soft/Features/Reviews/presentation/view/reviews_view.dart';

class AppRoutes {
  // AppRoutes._();
  static const String discoverView = "DISCOVER_VIEW";
  static const String productDetailsView = "PRODUCT_DETAILS_VIEW";
  static const String reviewsView = "REVIEWS_VIEW";
  static const String filterView = "FILTER_VIEW";
  static const String cartView = "CART_VIEW";
  static const String orderView = "ORDER_VIEW";

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.discoverView,
        path: "/",
        //TODO: DivsoverView
        builder: (context, state) => const OrderView(),
      ),
      GoRoute(
        name: AppRoutes.filterView,
        path: "/filter",
        builder: (context, state) => const FilterView(),
      ),
      GoRoute(
        name: AppRoutes.productDetailsView,
        path: "/productDetails",
        builder: (context, state) {
          ProductModel model = state.extra as ProductModel;
          return ProductDetailsView(item: model);
        },
      ),
      GoRoute(
        name: AppRoutes.reviewsView,
        path: "/reviews",
        builder: (context, state) {
          ProductModel model = state.extra as ProductModel;
          return ReviewsView(item: model);
        },
      ),
      GoRoute(
        name: AppRoutes.cartView,
        path: "/cart",
        builder: (context, state) => const CartView(),
      ),
      GoRoute(
        name: AppRoutes.orderView,
        path: "/order",
        builder: (context, state) => const OrderView(),
      ),
    ],
  );
}
