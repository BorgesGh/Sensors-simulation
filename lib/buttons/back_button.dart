import 'dart:ui';

import 'package:flame/components.dart';
import 'package:seminario_movimentos/forge2/ball_game/bolinha_forge.dart';
import 'simple_button.dart';

class BackButton extends SimpleButton with HasGameReference<BolinhaForge> {
  BackButton()
      : super(
          Path()
            ..moveTo(22, 8)
            ..lineTo(10, 20)
            ..lineTo(22, 32)
            ..moveTo(12, 20)
            ..lineTo(34, 20),
          position: Vector2.all(20),
        );

  @override
  void action() => game.route.pop();
}