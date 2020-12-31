import 'dart:ui';

import 'package:christmas_flutter/christmas_game.dart';
import 'package:christmas_flutter/person.dart';
import 'package:flame/sprite.dart';

class Enzo extends Person {
  Enzo(ChristmasGame game, double x, double y) : super(game) {
    personRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
    personSprite = List<Sprite>();
    personSprite.add(Sprite('enzo.png'));
    personSprite.add(Sprite('enzo.png'));
    deadSprite = Sprite('enzo.png');
  }
}