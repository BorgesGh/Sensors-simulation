import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:seminario_movimentos/home_page.dart';
import 'package:seminario_movimentos/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  // Bloquear o dispositivo no modo retrato
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = goRouter();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
