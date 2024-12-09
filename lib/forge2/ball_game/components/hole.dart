import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

import 'ball.dart';

class Hole extends BodyComponent with ContactCallbacks {

  late final double raio;
  late final Vector2 position;

  Hole({required this.raio, required this.position}) : super (
      bodyDef:BodyDef(
        type: BodyType.static,
        position: position,
        active: true,
      ),
    fixtureDefs: [
      FixtureDef(
        CircleShape()..radius = raio,
        density: 5,
        friction: 2,

      ),
    ],
    paint: Paint()..color = Colors.white
  );

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Ball) {
      debugPrint("Bolinha caiu no buraco");
      other.removeFromParent();
    }
    super.beginContact(other, contact);
  }

  // @override
  // void onMount() {
  //   add(MoveByEffect(
  //       Vector2(0, 20), EffectController(infinite: true,duration: 5,curve: Curves.easeInOut)
  //   ));
  //   super.onMount();
  // }
}
