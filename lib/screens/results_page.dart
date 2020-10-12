
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/components/constants.dart';
import 'package:bmi_calculator_flutter/components/reusable_card.dart';
import 'package:bmi_calculator_flutter/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({this.bmiScore,this.resultVerdict,this.comment});
  final String bmiScore;
  final String resultVerdict;
  final String comment;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                  child: Text(
                'YOUR RESULT!',
                style: TextStyle(fontSize: 40.0),
              )),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              onPress: () {},
              cardChild: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultVerdict,
                      style: kBmiStatusTextStyle),
                  Text(
                    bmiScore,
                    style: kResultDigitTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      comment,
                      style: kCommentTextStyle,
                    ),
                  )
                ],
              )),
              colour: kActiveCardColor,
              activeBorderColor: kActiveCardBorderColor,
            ),
          ),
          BottomButton(buttonTitle: 'TAP TO RE-CALCULATE',onTap: (){
            Navigator.pop(context);
          },)
        ],
      )),
    );
  }
}
