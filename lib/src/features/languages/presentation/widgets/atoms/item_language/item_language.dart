import 'package:flutter/material.dart';

class ItemLanguage extends StatelessWidget {
  const ItemLanguage({
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
      dense: false,
      trailing: const Icon(
        Icons.menu,
        size: 16,
      ),
    );
  }
}
