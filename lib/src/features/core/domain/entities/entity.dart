import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class Entity with EquatableMixin {
  const Entity(this.itemId);

  final String itemId;

  @override
  List<Object> get props => [itemId];
}
