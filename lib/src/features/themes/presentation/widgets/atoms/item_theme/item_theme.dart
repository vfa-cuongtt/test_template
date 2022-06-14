import 'package:flutter/material.dart';

class ItemTheme extends StatelessWidget {
  const ItemTheme({
    Key? key,
    required this.name,
    this.onPressed,
  }) : super(key: key);

  final String name;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: const Icon(
        Icons.menu,
        size: 16,
      ),
      dense: false,
    );
  }
}
