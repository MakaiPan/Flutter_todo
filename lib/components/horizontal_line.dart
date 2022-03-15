import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final double dashedWidth;
  final double dashedHeight;
  final Color color;

  const HorizontalLine({
    Key? key,
    this.dashedHeight = 1,
    this.dashedWidth = double.infinity,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dashedWidth,
      height: dashedHeight,
      color: color,
    );
  }
}
