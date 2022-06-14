import 'package:test_template/src/features/core/domain/entities/entity.dart';
import 'package:test_template/src/features/themes/constants/enums.dart';

/// The ThemeID is an important concept in our domain
/// so it deserves a type of its own
typedef ThemeID = String;

class ThemeEntity implements Entity {
  const ThemeEntity({required this.id, required this.name, required this.code});

  final ThemeID id;
  final String name;
  final SelectAppTheme code;

  @override
  String get itemId => id;

  @override
  List<Object> get props => [id];

  @override
  bool? get stringify => true;
}
