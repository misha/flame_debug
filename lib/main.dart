import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flame Debug',
      home: GameWidget(game: Game()),
    );
  }
}

class Game extends FlameGame with TapDetector {
  @override
  FutureOr<void> onLoad() {
    world.add(
      CircleComponent(
        anchor: Anchor.center,
        radius: 50,
        paint: Paint() //
          ..color = Colors.red,
      ),
    );

    return super.onLoad();
  }

  @override
  void onTapUp(TapUpInfo info) {
    componentsAtPoint(info.eventPosition.global)
        .whereType<CircleComponent>()
        .iterator
        .moveNext();
  }
}
