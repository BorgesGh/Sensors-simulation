import 'package:flame/game.dart';
import 'package:seminario_movimentos/forge2/jump_game/jump_game.dart';
import 'forge2/ball_game/components/ball_game.dart';
import 'forge2/home_page.dart';

class AppRoute extends RouterComponent {
  AppRoute()
      : super(routes: {
    "/": Route(HomePage.new),
    "/ball": WorldRoute(BallGame.new),
    "/pou" : WorldRoute(JumpGame.new),
  }, initialRoute: "/");
}