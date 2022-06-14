import 'package:flutter/material.dart';

class GroupListSettings extends StatelessWidget {
  const GroupListSettings({Key? key, required this.title, required this.child})
      : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    //////////////////////////////////////////////////////////
    // Define variable theme.
    //////////////////////////////////////////////////////////
    final colorCardTheme = Theme.of(context).cardTheme.color;
    final styledTitle = Theme.of(context).textTheme.headline6;

    //////////////////////////////////////////////////////////
    // Widget tree goes here.
    //////////////////////////////////////////////////////////
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          child: Text(
            title,
            style: styledTitle,
          ),
        ),
        Card(
          color: colorCardTheme,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          child: child,
        ),
      ],
    );
  }
}
