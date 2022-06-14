import 'package:flutter/material.dart';

class ImageRounded extends StatelessWidget {
  const ImageRounded({
    Key? key,
    required this.size,
    required this.leftRadius,
    required this.rightRadius,
    required this.link,
    required this.alignment,
  }) : super(key: key);

  final double size;
  final double leftRadius;
  final double rightRadius;
  final String link;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(leftRadius),
          right: Radius.circular(rightRadius),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(leftRadius),
          right: Radius.circular(rightRadius),
        ),
        child: Image.network(
          link,
          fit: BoxFit.cover,
          alignment: alignment,
          width: size,
          height: size,
        ),
      ),
    );
  }
}
