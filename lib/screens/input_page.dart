import 'dart:async';
import 'package:bmi_calculator_flutter/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/functional_button.dart';
import '../components/reusable_card.dart';
import 'package:bmi_calculator_flutter/components//constants.dart';
import '../components/slider_&_icons.dart';
import '../components/bottom_button.dart';
import '../components/calculation_core.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 55;
  int age = 18;
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //Top card to select Gender
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.Male;
                      });
                    },
                    colour: selectedGender == GenderType.Male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    activeBorderColor: selectedGender == GenderType.Male
                        ? kActiveCardBorderColor
                        : kInactiveCardBorderColor,
                    cardChild: IconContent(
                      genderName: 'MALE',
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.Female;
                      });
                    },
                    colour: selectedGender == GenderType.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    activeBorderColor: selectedGender == GenderType.Female
                        ? kActiveCardBorderColor
                        : kInactiveCardBorderColor,
                    cardChild: IconContent(
                      genderName: 'FEMALE',
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Middle card with slider and buttonIcon for Height Changing
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toStringAsFixed(0),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          flex: 2,
                          child: SliderButton(
                            onPress: () {
                              setState(() {
                                if (height > kMinHeight) height--;
                              });
                            },
                            sliderIcon: Icons.remove,
                          )),

                      // SliderClassProperties
                      Expanded(
                        flex: 9,
                        child: SliderClass(
                          mySlider: Slider(
                            min: kMinHeight,
                            max: kMaxHeight,
                            value: height.roundToDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        ),
                      ),

                      //Slider button minus
                      Expanded(
                          flex: 2,
                          child: SliderButton(
                            onPress: () {
                              setState(() {
                                if (height < kMaxHeight) height++;
                              });
                            },
                            sliderIcon: Icons.add,
                          )),
                    ],
                  ),
                ],
              ),
              colour: kActiveCardColor,
              activeBorderColor: kActiveCardBorderColor,
            ),
          ),

          //Bottom card for weight and age
          Expanded(
            child: Row(
              children: [
                //Weight card with functionality
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    activeBorderColor: kActiveCardBorderColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FunctionalButton(
                              onClick: () {
                                setState(() {
                                  if (weight > kMinWeight) weight--;
                                });
                              },
                              timer: timer,
                              buttonIcon: FontAwesomeIcons.minus,
                              onClickDown: (TapDownDetails details) {
                                timer = Timer.periodic(
                                  Duration(milliseconds: 100),
                                  (timer) {
                                    setState(() {
                                      if (weight > kMinWeight) weight--;
                                    });
                                  },
                                );
                              },
                              onClickUp: (TapUpDetails details) {
                                timer.cancel();
                              },
                              onClickCancel: () {
                                timer.cancel();
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FunctionalButton(
                              onClick: () {
                                setState(() {
                                  if (weight < kMaxWeight) weight++;
                                });
                              },
                              timer: timer,
                              buttonIcon: FontAwesomeIcons.plus,
                              onClickDown: (TapDownDetails details) {
                                timer = Timer.periodic(
                                    Duration(milliseconds: 100), (timer) {
                                  setState(() {
                                    if (weight < kMaxWeight) weight++;
                                  });
                                });
                              },
                              onClickUp: (TapUpDetails details) {
                                timer.cancel();
                              },
                              onClickCancel: () {
                                timer.cancel();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                //Age card with functionality
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    activeBorderColor: kActiveCardBorderColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FunctionalButton(
                              onClick: () {
                                setState(() {
                                  if (age > kMinWeight) age--;
                                });
                              },
                              timer: timer,
                              buttonIcon: FontAwesomeIcons.minus,
                              onClickDown: (TapDownDetails details) {
                                timer = Timer.periodic(
                                  Duration(milliseconds: 100),
                                  (timer) {
                                    setState(() {
                                      if (age > kMinWeight) age--;
                                    });
                                  },
                                );
                              },
                              onClickUp: (TapUpDetails details) {
                                timer.cancel();
                              },
                              onClickCancel: () {
                                timer.cancel();
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            FunctionalButton(
                              onClick: () {
                                setState(() {
                                  if (age < kMaxWeight) age++;
                                });
                              },
                              timer: timer,
                              buttonIcon: FontAwesomeIcons.plus,
                              onClickDown: (TapDownDetails details) {
                                timer = Timer.periodic(
                                    Duration(milliseconds: 100), (timer) {
                                  setState(() {
                                    if (age < kMaxWeight) age++;
                                  });
                                });
                              },
                              onClickUp: (TapUpDetails details) {
                                timer.cancel();
                              },
                              onClickCancel: () {
                                timer.cancel();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Bottom space color container
          BottomButton(
            buttonTitle: 'TAP TO CALCULATE',
            onTap: () {
              CalculationCore result =
                  CalculationCore(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiScore: result.getCalculateBMI(),
                resultVerdict: result.getResult(),
                comment: result.getCommentOnResult(),
              )));
            },
          )
        ],
      ),
    );
  }
}
