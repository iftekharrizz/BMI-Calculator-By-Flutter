import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'funtional_button.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'slider_&_icons.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;
  int height = 180;
  int weight = 55;
  Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    activeBorder: selectedGender == GenderType.Male
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
                    activeBorder: selectedGender == GenderType.Female
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
                        height.toString(),
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
                            value: height.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.toInt();
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
              activeBorder: kActiveCardBorderColor,
            ),
          ),

          //Bottom card to
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    activeBorder: kInactiveCardBorderColor,
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
                              buttonIcon: Icons.remove,
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
                              buttonIcon: Icons.add,
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
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    activeBorder: kInactiveCardBorderColor,
                  ),
                ),
              ],
            ),
          ),

          //Bottom space color container
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
