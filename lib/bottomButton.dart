import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function tapOutcome;
  BottomButton({this.buttonText,this.tapOutcome});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapOutcome,
        child: Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15.0),
        child: Center(child: Text(buttonText,style: kButtonBotomStyle,)),
      ),
    );
  }
}