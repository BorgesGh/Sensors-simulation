import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:seminario_movimentos/buttons/rounded_button.dart';
import 'package:seminario_movimentos/forge2/ball_game/bolinha_forge.dart';

class HomePage extends Component with HasGameRef<BolinhaForge> {
  late final TextComponent _logo;
  late final RoundedButton _button1;
  late final RoundedButton _button2;

  HomePage() {
    addAll([
      _logo = TextComponent(
        text: 'Sensors Game',
        textRenderer: TextPaint(
          style: const TextStyle(
            fontSize: 60,
            color: Colors.amber,
          ),
        ),
        anchor: Anchor.center,
      ),
      _button1 = RoundedButton(
        text: 'Bolinhas',
        action: () => gameRef.route.pushNamed('/ball'),
        color: const Color(0xffadde6c),
        borderColor: const Color(0xffedffab),
      ),
      _button2 = RoundedButton(
        text: 'Pou',
        action: () => gameRef.route.pushNamed('/pou'),
        color: const Color(0xffdebe6c),
        borderColor: const Color(0xfffff4c7),
      ),
    ]);
  }
  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    _logo.position = Vector2(size.x / 2, size.y / 3);
    _button1.position = Vector2(size.x / 2, _logo.y + 80);
    _button2.position = Vector2(size.x / 2, _logo.y + 140);
  }
}
