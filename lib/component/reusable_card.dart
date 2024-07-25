import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard({
    required this.colour,
    this.cardChild,
    this.gestureFunc,
  });

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? gestureFunc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureFunc,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}