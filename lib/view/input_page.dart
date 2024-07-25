import 'package:bmi_calculator/component/claculate_bmi_brain.dart';
import 'package:bmi_calculator/view/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:bmi_calculator/component/gender_content.dart';
import 'package:bmi_calculator/component/constant.dart';
import 'package:bmi_calculator/component/round_icon_button.dart';
import 'package:bmi_calculator/component/buttom_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 70;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      gestureFunc: () {
                        selectedGender = Gender.male;
                        setState(() {});
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: genderContent(
                        icon: FontAwesomeIcons.mars,
                        text: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      gestureFunc: () {
                        selectedGender = Gender.female;
                        setState(() {});
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: genderContent(
                        icon: FontAwesomeIcons.venus,
                        text: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Height',
                        style: kSLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kBLabelTextStyle,
                          ),
                          Text(
                            'cm',
                            style: kSLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFFEB1555),
                            thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayColor: Color(0x29EB1555),
                            overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25)),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (double value) {
                              height = value.round();
                              setState(() {});
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kSLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                iconData: FontAwesomeIcons.minus,
                                onPress: () {
                                  weight--;
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                iconData: FontAwesomeIcons.plus,
                                onPress: () {
                                  weight++;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kSLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kBLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                onPress: () {
                                  age--;
                                  setState(() {});
                                },
                                iconData: FontAwesomeIcons.minus,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  onPress: () {
                                    age++;
                                    setState(() {});
                                  },
                                  iconData: FontAwesomeIcons.plus)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtomButton(
              labelText: 'CALCULATE',
              onTap: () {
                CalculateBmiBrain cal = CalculateBmiBrain(
                    height: height, weight: weight);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        ResultPage(
                          bmiResult: cal.calculateBmi(),
                          label: cal.getLabel(),
                          comment: cal.getCComment(),

                        )));
              },
            ),
          ],
        ));
  }
}



