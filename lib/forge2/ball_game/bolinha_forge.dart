import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:seminario_movimentos/AppRoute.dart';

class BolinhaForge extends Forge2DGame with TapCallbacks{
  final route = AppRoute();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(route);
  }

  void voltar(){
    removeFromParent();
    route.pop();
  }
}