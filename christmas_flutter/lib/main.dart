import 'package:christmas_flutter/christmas_game.dart';
import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  ChristmasGame game = ChristmasGame();
  runApp(game.widget);
}