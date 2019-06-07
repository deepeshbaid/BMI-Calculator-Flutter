import 'dart:math';

class CalculatorBrain{
  final int height;
  final int weight;
  double _bmi;
  CalculatorBrain({this.height,this.weight});

  String calculateBMI()
  {
    double bmi=weight/pow(height/100,2);
    _bmi=bmi;
    return bmi.toStringAsFixed(1);
  }

  String getResult()
  {
    if(_bmi>=25)
    return 'Overweight';
    else if(_bmi>=18.5)
    return 'Normal';
    else
    return 'Underweight';
  }

  String getMessage()
  {
    if(_bmi>=25)
    return 'You have a higher bmi than normal. Excersise more!';
    else if(_bmi>=18.5)
    return 'Congrats! You are fit..Keep it up :)';
    else
    return 'You have a lower bmi. Please eat healthy food and exercise regularly!';
  }
}