import 'dart:ui';

import 'package:christmas_flutter/christmas_game.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/sprite.dart';

class Person{

  List<Sprite> personSprite;
  Sprite deadSprite;
  double personSpriteIndex = 0;
  bool isDead = false;
  Rect personRect;
  final ChristmasGame game;
  bool isOffScreen = false;

  double get speed => game.tileSize * 3;
  Offset targetLocation;



  Person(this.game){
    setTargetLocation();
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, personRect.inflate(2));
    } else {
      personSprite[personSpriteIndex.toInt()].renderRect(c, personRect.inflate(2));
    }
  }
  void update(double t) {
    if (isDead) {
      personRect = personRect.translate(0, game.tileSize * 12 * t);
      if (personRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      personSpriteIndex += 30 * t;
      if (personSpriteIndex >= 2) {
        personSpriteIndex -= 2;
      }
    }

    double stepDistance = speed * t;
    Offset toTarget = targetLocation - Offset(personRect.left, personRect.top);
    if (stepDistance < toTarget.distance) {
      Offset stepToTarget = Offset.fromDirection(toTarget.direction, stepDistance);
      personRect = personRect.shift(stepToTarget);
    } else {
      personRect = personRect.shift(toTarget);
      setTargetLocation();
    }
  }

  void setTargetLocation() {
    double x = game.rnd.nextDouble() * (game.screenSize.width - (game.tileSize * 2.025));
    double y = game.rnd.nextDouble() * (game.screenSize.height - (game.tileSize * 2.025));
    targetLocation = Offset(x, y);
  }

  void onTapDown() {
    isDead = true;
    game.spawnPerson();
  }
}