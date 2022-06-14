import 'package:flutter/widgets.dart';
import 'package:test_template/src/features/core/domain/entities/entity.dart';

@immutable
abstract class Model extends Entity {
  const Model(String itemId) : super(itemId);
}
