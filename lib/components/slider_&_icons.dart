import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/components//constants.dart';

class IconContent extends StatelessWidget {
  final String genderName;
  final IconData genderIcon;
  IconContent({@required this.genderName, this.genderIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 18,
        ),
        Text(
          genderName,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

class SliderClass extends StatelessWidget {
  final Slider mySlider;
  SliderClass({@required this.mySlider});
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.orange,
        inactiveTrackColor: Colors.white,
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 1.2,
        thumbColor: Colors.orange,
        thumbShape:
        RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayColor: Colors.orange.withAlpha(32),
        overlayShape:
        RoundSliderOverlayShape(overlayRadius: 20.0),
      ),
      child: mySlider,
    );
  }
}


class SliderButton extends StatelessWidget {

  final IconData sliderIcon;
  final Function onPress;
  SliderButton({@required this.sliderIcon,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Icon(sliderIcon),
    );
  }
}

class AdjustButton extends StatelessWidget {
    final Function onClick;
    final IconData iconButton;
   AdjustButton({@required this.onClick,this.iconButton});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onClick,
      child: Icon(iconButton,color: kInactiveCardColor,),
    );
  }
}


