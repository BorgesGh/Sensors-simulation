import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:seminario_movimentos/forge2/ball_game/components/hole.dart';
import 'package:seminario_movimentos/forge2/ball_game/components/wall.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Ball extends BodyComponent with TapCallbacks, ContactCallbacks {
  Vector2 accelerometerForce = Vector2.zero();

  Ball({Vector2? initialPosition, required double raio})
      : super(
    paint: Paint()..color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1),
    fixtureDefs: [
      FixtureDef(
        CircleShape()..radius = raio,
        restitution: 0.8, // Aumente o salto nas colisões
        friction: 0.3,
        density: 0.6,   // o quanto a bolinha resiste para ser puxada pela inercia
      ),
    ],
    bodyDef: BodyDef(
      angularDamping: 0.5, //Controle do giro
      linearDamping: 0.1,  //Diminui a velocidade linear gradualmente
      position: initialPosition ?? Vector2.zero(),
      type: BodyType.dynamic, // Movimento
    ),
  );

  @override
  void onMount() {
    accelerometerEventStream().listen((event) {
      accelerometerForce = Vector2(-event.x, event.y).scaled(1000);
    });
    super.onMount();
  }

  @override
  void update(double dt) {
    // Aplica força do acelerômetro ao corpo
    body.applyForce(accelerometerForce * dt);
    super.update(dt);
  }
}

