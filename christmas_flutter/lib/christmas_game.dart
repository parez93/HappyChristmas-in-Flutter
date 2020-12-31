import 'dart:math';
import 'dart:ui';

import 'package:christmas_flutter/background.dart';
import 'package:christmas_flutter/enzo.dart';
import 'package:christmas_flutter/federico.dart';
import 'package:christmas_flutter/person.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flame/sprite.dart';

class ChristmasGame extends Game with TapDetector {

  Size screenSize;
  double tileSize;

  Background _tree;
  List<Person> persons;

  Random rnd;

  ChristmasGame(){
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    persons = [];
    rnd = Random();
    _tree = Background(this);
    spawnPerson();
  }



  @override
  void onTap() {
  }

  @override
  void render(Canvas canvas) {
    _tree.render(canvas);
    persons.forEach((Person p) => p.render(canvas));
  }

  @override
  void update(double t) {
    persons.forEach((Person p) => p.update(t));
    persons.removeWhere((Person p) => p.isOffScreen);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void spawnPerson() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
    persons.add(Federico(this, x, y));

    double x2 = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y2 = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
    persons.add(Enzo(this, x2, y2));
  }
}