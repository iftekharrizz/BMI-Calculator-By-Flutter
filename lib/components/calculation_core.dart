import 'dart:math';

class CalculationCore {
  CalculationCore({this.height, this.weight});
  final int height;
  final int weight;
  double _bmiScore;

  String getCalculateBMI() {
    _bmiScore = weight / pow(height / 100, 2);
    return _bmiScore.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmiScore >= 25) {
      return 'OVER WEIGHT';
    } else if (_bmiScore >= 18) {
      return "NORMAL";
    } else
      return 'UNDER WEIGHT';
  }

  String getCommentOnResult() {
    if (_bmiScore >= 25) {
      return "Your body weight is HIGHER than normal body weight. Try to exercise more."
          "GOOD LUCK!";
    } else if (_bmiScore >= 18) {
      return "You have a normal body weight according to your height."
          "GOOD JOB!!";
    } else
      return "You have a weight that is lower than normal body weight."
          "Try to eat a bit more."
          "GOOD LUCK!";
  }
}
