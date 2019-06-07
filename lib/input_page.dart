import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottomButton.dart';
import 'calculatorBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kActiveCardColour;
  Color femaleCardColor = kInactiveCardColour;
  int height = 120;
  int weight = 50;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        maleCardColor = kActiveCardColour;
                        femaleCardColor = kInactiveCardColour;
                      });
                    },
                    colour: maleCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      iconText: 'MALE',
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        maleCardColor = kInactiveCardColour;
                        femaleCardColor = kActiveCardColour;
                      });
                    },
                    colour: femaleCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      iconText: 'FEMALE',
                    ),
                  ))
                ],
              ),
            ),
            Expanded(
                child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kMainTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xffeb1555),
                      activeTrackColor: Colors.white,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29ff1555),
                      inactiveTrackColor: Color(0xff8d8e98),
                    ),
                    child: Slider(
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                        value: height.toDouble()),
                  ),
                ],
              ),
            )),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kMainTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedCustomButton(
                              iconName: FontAwesomeIcons.minus,
                              buttonFunction: () {
                                setState(() {
                                  weight--;
                                  if (weight < 2) {
                                    weight = 2;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedCustomButton(
                              iconName: FontAwesomeIcons.plus,
                              buttonFunction: () {
                                setState(() {
                                  weight++;
                                  if (weight > 700) {
                                    weight = 700;
                                  }
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kMainTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedCustomButton(
                              iconName: FontAwesomeIcons.minus,
                              buttonFunction: () {
                                setState(() {
                                  age--;

                                  if (age < 5) {
                                    age = 5;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedCustomButton(
                              iconName: FontAwesomeIcons.plus,
                              buttonFunction: () {
                                setState(() {
                                  age++;
                                  if (age > 120) {
                                    age = 120;
                                  }
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
           BottomButton(buttonText: 'RESULT',tapOutcome: (){
             CalculatorBrain calc=CalculatorBrain(weight: weight,height: height);
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
               bmiResult: calc.calculateBMI(),
               bmiMessage: calc.getMessage(),
               resultText: calc.getResult(),
             )));
           },),
          ],
          
        ));
  }
}



class RoundedCustomButton extends StatelessWidget {
  final IconData iconName;
  final Function buttonFunction;
  RoundedCustomButton({this.iconName, this.buttonFunction});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: buttonFunction,
      child: Icon(iconName),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
