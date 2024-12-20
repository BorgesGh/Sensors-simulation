import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:seminario_movimentos/forge2/ball_game/bolinha_forge.dart';
import 'package:seminario_movimentos/forge2/ball_game/components/wall.dart';

import '../../../buttons/back_button.dart';
import 'ball.dart';
import 'hole.dart';

class BallGame extends Forge2DWorld with HasGameRef<BolinhaForge>{
  var balls = <Ball>[];

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    double yPos = 0;
    double xPos = -10;

    double raioDaBola = 1;

    // Adiciona várias bolinhas com posições iniciais diferentes
    balls = List.generate(
        30, // Número de bolinhas
            (index) {

          final point = Vector2(xPos,yPos);
          xPos += raioDaBola + 0.1;

          if(point.x > gameRef.camera.visibleWorldRect.right - 10){
            yPos += 10;
            xPos = 0;
          }

          return Ball(initialPosition: Vector2(point.x, point.y),raio: raioDaBola);
        }
    );
    addAll(balls);

    // Adiciona as paredes de limite
    addAll(createBoundaries());

    //add hole
    add(Hole(position: Vector2(24, 0),raio: 5));
    add(Hole(position: Vector2(-24, 0),raio: 5));
    add(Hole(position: Vector2(0, 45),raio: 5));
    add(Hole(position: Vector2(0, -45),raio: 5));
  }

  List<Component> createBoundaries() {
    final visibleRect = gameRef.camera.visibleWorldRect;
    final topLeft = visibleRect.topLeft.toVector2();
    final topRight = visibleRect.topRight.toVector2();
    final bottomRight = visibleRect.bottomRight.toVector2();
    final bottomLeft = visibleRect.bottomLeft.toVector2();

    return [
      Wall(topLeft, topRight),
      Wall(topRight, bottomRight),
      Wall(bottomLeft, bottomRight),
      Wall(topLeft, bottomLeft),
    ];
  }
}