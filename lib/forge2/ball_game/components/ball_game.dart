import 'dart:core';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/cupertino.dart';
import 'package:seminario_movimentos/forge2/ball_game/components/wall.dart';
import 'ball.dart';
import 'hole.dart';

class BallGame extends Forge2DGame{

  late double width;
  late double height;


  BallGame({required this.width, required this.height,}) : super(
      world: Forge2DWorld(
          gravity: Vector2(0, 100)
      ),
  ){
    debugPrint("$width $height");
  }

  var balls = <Ball>[];
  final hudComponents = <Component>[];

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    double yPos = 0;
    double xPos = -10;

    double raioDaBola = 5;
    // Adiciona várias bolinhas com posições iniciais diferentes
    balls = List.generate(
        30, // Número de bolinhas
            (index) {

          final point = Vector2(xPos,yPos);
          xPos += raioDaBola + 0.1;

          if(point.x > camera.visibleWorldRect.right - 10){
            yPos += 10;
            xPos = 0;
          }

          return Ball(initialPosition: Vector2(point.x, point.y),raio: raioDaBola);
        }
    );
    addAll(balls);

    // Adiciona as paredes de limite

    camera.viewfinder.zoom = 0.5;
    addAll(createBoundaries());

    //add hole
    add(Hole(position: Vector2(-10, -30),raio: 5));
    add(Hole(position: Vector2(10, -30),raio: 5));

  }

  List<Component> createBoundaries() {
    final visibleRect = camera.visibleWorldRect;
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