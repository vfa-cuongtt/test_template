import 'package:flutter/material.dart';

class SheetHeader extends StatelessWidget {
  const SheetHeader({
    Key? key,
    this.title = 'Booked Exhibition',
    required this.fontSize,
    required this.topMargin,
  }) : super(key: key);

  final String title;
  final double fontSize;
  final double topMargin;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
