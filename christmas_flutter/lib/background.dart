import 'dart:ui';

import 'package:christmas_flutter/christmas_game.dart';
import 'package:flame/sprite.dart';

class Background {
  final ChristmasGame game;
  Sprite bgSprite;
  Rect bgRect;

  Background(this.game){
    bgSprite = Sprite('christmas-tree.jpg');
    bgRect = Rect.fromLTWH(
        0, 0, game.screenSize.width, game.screenSize.height
    );
  }

  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  void update(double t) {}
}