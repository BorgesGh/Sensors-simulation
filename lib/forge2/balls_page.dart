import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seminario_movimentos/forge2/ball_game/components/ball_game.dart';
import 'package:seminario_movimentos/router.dart';

class BallsPage extends StatelessWidget {
  const BallsPage({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       alignment: Alignment.center,
  //       fit: StackFit.expand,
  //       children: [
  //         Positioned(
  //           child: GameWidget(
  //             game: BallGame(
  //               width: MediaQuery.of(context).size.width,
  //               height: MediaQuery.of(context).size.height,
  //             ),
  //                       ),
  //         ),
  //         Positioned(
  //           top: 10,
  //             child: ElevatedButton(
  //                 onPressed: (){
  //                   context.pop();
  //                 },
  //                 child: const Text("Voltar")
  //             ),
  //         )
  //       ],
  //     ),
  //   ) ;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GameWidget(
            game: BallGame(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ),
      ],
    );
  }
}
