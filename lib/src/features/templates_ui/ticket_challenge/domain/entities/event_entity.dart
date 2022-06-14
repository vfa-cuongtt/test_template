import 'package:flutter/material.dart';
import 'package:test_template/src/features/core/domain/entities/entity.dart';

/// The EventID is an important concept in our domain
/// so it deserves a type of its own
typedef EventID = String;

@immutable
class EventEntity implements Entity {
  const EventEntity({
    required this.id,
    required this.link,
    required this.title,
    required this.date,
    required this.location,
  });

  final EventID id;
  final String link;
  final String title;
  final String date;
  final String location;

  @override
  String get itemId => id;

  @override
  bool? get stringify => true;

  @override
  List<Object> get props => [id];
}
