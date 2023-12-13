import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:priority_soft/Core/models/product_model.dart';
import 'package:priority_soft/Features/Discover/presentation/view/discover_view.dart';
import 'package:priority_soft/Features/Filter/presentation/view/filter_view.dart';
import 'package:priority_soft/Features/ProductDetails/presentation/view/product_details_view.dart';
import 'package:priority_soft/Features/Reviews/presentation/view/reviews_view.dart';

class AppRoutes {
  // AppRoutes._();
  static const String discoverView = "DISCOVER_VIEW";
  static const String productDetailsView = "PRODUCT_DETAILS_VIEW";
  static const String reviewsView = "REVIEWS_VIEW";
  static const String filterView = "FILTER_VIEW";

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.discoverView,
        path: "/",
        builder: (context, state) => const DivsoverView(),
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
    ],
  );
}
