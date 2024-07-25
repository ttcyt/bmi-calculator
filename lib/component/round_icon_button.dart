import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.onPress, required this.iconData});

  final IconData iconData;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minHeight: 56, minWidth: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF8D8E98),
      onPressed: onPress,
      child: Icon(
        iconData,
        size: 20,
      ),
    );
  }
}

