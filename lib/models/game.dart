import 'dart:math';

class Game {
  static final int MIN_VALUE = 0;
  static final int MAX_VALUE = 100;

  int _targetValue = 0;
  int _points = 0;
  int _score = 0;
  int _rounds = 0;
  //Queremos guardar las marcas en una lista de listas, donde cada lista contiene el score y el round.
  //Para ello, utilizamos List<List<int>>. La primera lista contiene el score y la segunda el round.
  List<List<int>> _marks = [];


  int get targetValue => _targetValue;
  int get points => _points;
  int get score => _score;
  int get rounds => _rounds;
  List<List<dynamic>> get marks => _marks;

  Game() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
  }

  void calculatePoints(double sliderValue) {
    int sliderValueInt = sliderValue.round().toInt();
    int difference = (_targetValue - sliderValueInt).abs();
    _points = (MAX_VALUE - difference);
    _score += _points;
    _rounds++;
  }

  void reset() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    _points = 0;
  }
  void restartGame(){
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    //Guardamos la marca en la lista de marcas al reiniciar el juego.
    _marks.add([_score, _rounds]);
    _points = 0;
    _score = 0;
    _rounds = 0;
  }
}
