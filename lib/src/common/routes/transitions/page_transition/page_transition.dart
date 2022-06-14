import 'package:flutter/material.dart';

Widget fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final curvedAnimation =
      CurvedAnimation(curve: Curves.linear, parent: animation);
  return FadeTransition(
    opacity: curvedAnimation,
    child: child,
  );
}

Widget slideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final curvedAnimation =
      CurvedAnimation(curve: Curves.linear, parent: animation);

  return SlideTransition(
    position: Tween(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(curvedAnimation),
    child: child,
  );
}

Widget scaleTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final curvedAnimation =
      CurvedAnimation(curve: Curves.linear, parent: animation);

  return ScaleTransition(
    scale: curvedAnimation,
    child: child,
  );
}

Widget sizeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final curvedAnimation =
      CurvedAnimation(curve: Curves.linear, parent: animation);

  return Align(
    child: SizeTransition(
      sizeFactor: curvedAnimation,
      child: child,
    ),
  );
}

Widget rotateTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final curvedAnimation =
      CurvedAnimation(curve: Curves.linear, parent: animation);

  return RotationTransition(
    turns: curvedAnimation,
    child: child,
  );
}
