import 'package:go_router/go_router.dart';
import 'package:priority_soft/Features/Discover/presentation/view/discover_view.dart';

class AppRoutes {
  // AppRoutes._();
  static const String discoverView = "DISCOVER_VIEW";
  //static const String signUpView = "SIGNUP_VIEW";

  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.discoverView,
        path: "/",
        builder: (context, state) => const DivsoverView(),
      ),
      // GoRoute(
      //   name: AppRoutes.signUpView,
      //   path: "/signup",
      //   builder: (context, state) => const SignUpView(),
      // ),
    ],
  );
}
