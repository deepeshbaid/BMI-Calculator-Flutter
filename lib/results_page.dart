import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'bottomButton.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
   final String resultText;
    final String bmiMessage;
    ResultsPage({this.bmiMessage,this.bmiResult,this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText,
                      style: kResultTextColor,
                    ),
                    Text(
                      bmiResult,
                      style: kBMIstyle,
                    ),
                    Text(
                      bmiMessage,
                      style: kBMImessage,
                      textAlign: TextAlign.center,
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
           BottomButton(buttonText: 'RECALCULATE',tapOutcome: (){
             Navigator.pop(context);
           },)
        ],
      ),
    );
  }
}
