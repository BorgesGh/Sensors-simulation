import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:seminario_movimentos/forge2/ball_game/components/wall.dart';

import '../ball_game/bolinha_forge.dart';

class JumpGame extends Forge2DWorld with HasGameRef<BolinhaForge>{


  @override
  void onMount() {
    add(Wall(Vector2(gameRef.camera.visibleWorldRect.left,gameRef.camera.visibleWorldRect.bottom),
        Vector2(gameRef.camera.visibleWorldRect.right,gameRef.camera.visibleWorldRect.bottom)));


    add(BodyComponent(bodyDef: BodyDef(
      position: Vector2(0,0),
      type: BodyType.static,
    ),
      fixtureDefs: [
        FixtureDef(
          PolygonShape()..setAsBoxXY(10, 1),
        ),
      ],
    ));
    super.onMount();
  }



}