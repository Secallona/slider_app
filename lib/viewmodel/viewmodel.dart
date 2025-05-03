import 'package:flutter/material.dart';
import 'package:slider_app/models/game.dart';

class Viewmodel extends ChangeNotifier {
  final Game _game = Game();

  int get targetValue => _game.targetValue;
  int get points => _game.points;
  int get score => _game.score;
  int get rounds => _game.rounds;
  List<List<dynamic>> get marks => _game.marks;

  void calculatePoints(double sliderValue) {
    _game.calculatePoints(sliderValue);
    notifyListeners();
  }
  void reset() {
    _game.reset();
    notifyListeners();
  }
  void restartGame() {
    _game.restartGame();
    notifyListeners();
  }
  
}