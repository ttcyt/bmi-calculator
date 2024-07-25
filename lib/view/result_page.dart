import 'package:bmi_calculator/component/buttom_button.dart';
import 'package:bmi_calculator/component/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/component/constant.dart';

class ResultPage extends StatefulWidget {
  ResultPage({super.key,required this.bmiResult,required this.label,required this.comment});
  String bmiResult;
  String label;
  String comment;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                'Your Result!',
                style: kTitleTextStyle,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kInactiveCardColor,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.label,
                    style: kResultTextStyle,
                  ),
                  Text(
                    widget.bmiResult,
                    style: kBmiTextStyle,
                  ),
                  Text(
                    widget.comment,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          ButtomButton(
            onTap: () {
              Navigator.pop(context);
            },
            labelText: 'RE-CALCULATE',
          )
        ],
      ),
    );
  }
}
