import 'dart:math';

class Calculatorbrain {
  Calculatorbrain({required this.weight, required this.height});
  final int height;
  final int weight;

  final double _bmi = 20.0;

  double campare = 0.0;

  String calculateBMI() {
    double _bmi = weight / pow((height / 100), 2);

    campare = _bmi;

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (campare >= 25) {
      return 'Overweight';
    } else if (campare > 18.5) {
      return 'Normal ';
    } else {
      return 'underweight';
    }
  }

  String getInterpretation() {
    if (campare >= 25) {
      print(_bmi);
      return 'Mota hai tu thoda Exercise kar kyaa baithaa rehta hai ';
    } else if (campare > 18.5) {
      print(_bmi);
      return 'waah re hero healthy bnegaa  ';
    } else {
      print(_bmi);
      return 'becharaa khaya piyaa kar thoda bhai ';
    }
  }
}
