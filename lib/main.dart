import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'forge2/ball_game/bolinha_forge.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Bloquear o dispositivo no modo retrato
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const GameWidget.controlled(gameFactory: BolinhaForge.new));
  });
}

