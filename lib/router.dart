
import 'package:go_router/go_router.dart';

import 'forge2/balls_page.dart';
import 'home_page.dart';

enum Routes{
  Home,
  balls
}


GoRouter goRouter() {
  return GoRouter(initialLocation: "/", routes: <RouteBase>[
    GoRoute(
      path: "/",
      name: Routes.Home.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: "/balls",
        name: Routes.balls.name,
        builder: (context, state) => const BallsPage()
    )
  ]);}