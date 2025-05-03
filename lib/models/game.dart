import 'dart:math';

class Game {
  static final int MIN_VALUE = 0;
  static final int MAX_VALUE = 100;

  int _targetValue = 0;
  int _points = 0;
  int _score = 0;
  int _rounds = 0;
  //Queremos guardar las marcas en una lista de listas, donde cada lista contiene la puntuación y la fecha.
  //Para ello, utilizamos List<List<dynamic>>.  
  List<List<dynamic>> _marks = [];
  //Lista para guardar las 5 mejores marcas.
  List<List<dynamic>> _top5marks = [];

  int get targetValue => _targetValue;
  int get points => _points;
  int get score => _score;
  int get rounds => _rounds;
  List<List<dynamic>> get marks => _marks;
  List<List<dynamic>> get top5marks => _top5marks;
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
    //Guardamos la marca en la lista de marcas al reiniciar el juego.
    DateTime now = DateTime.now();
    _marks.add([_points, now]);
    getTop5Marks();
    _points = 0;
  }
  void restartGame(){
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    _points = 0;
    _score = 0;
    _rounds = 0;
  }

  void getTop5Marks() {
    // 1. ORDENAMIENTO DE LAS MARCAS:
  // ------------------------------
  // Primero ordenamos la lista '_marks' de mayor a menor puntuación (score).
  // Cada elemento en '_marks' es una lista con dos valores: [score, fecha]
  //
  // La función sort recibe una función de comparación que determina el orden:
  // - (a, b)       : Recibe dos elementos a comparar (a y b)
  // - b[0]          : Accede al score del elemento b (segundo elemento en la comparación)
  // - a[0]          : Accede al score del elemento a (primer elemento en la comparación)
  // - compareTo()   : Método que compara los dos scores
  //
  // Al hacer b[0].compareTo(a[0]) en lugar de a[0].compareTo(b[0]),
  // invertimos el orden normal para que sea DESCENDENTE (de mayor a menor)
  _marks.sort((a, b) => b[0].compareTo(a[0]));

  // 2. SELECCIÓN DEL TOP 5:
  // -----------------------
  // Una vez ordenada la lista, tomamos solo los primeros 5 elementos:
  // - take(5)       : Toma los primeros 5 elementos de la lista ordenada
  // - toList()      : Convierte esos 5 elementos en una nueva lista
  //
  // Esto nos da las 5 mejores puntuaciones que guardamos en '_top5marks'
  _top5marks = _marks.take(5).toList();
  }
}
