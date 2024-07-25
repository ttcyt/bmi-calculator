import 'package:flutter/material.dart';
import 'package:bmi_calculator/component/constant.dart';

class ButtomButton extends StatelessWidget {
  ButtomButton({
    required this.onTap,
    required this.labelText,
  });

  final VoidCallback onTap;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kButtonContainerColor,
        width: double.infinity,
        height: kButtonContainerHeight,
        margin: EdgeInsets.only(top: 10),
        child: Center(
            child: Text(
              labelText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            )),
      ),
    );
  }
}