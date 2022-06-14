import 'package:test_template/src/features/core/domain/entities/entity.dart';

/// The LanguageID is an important concept in our domain
/// so it deserves a type of its own
typedef LanguageID = String;

class LanguageEntity implements Entity {
  const LanguageEntity({
    required this.id,
    required this.name,
    required this.languageCode,
  });

  final LanguageID id;
  final String name;
  final String languageCode;

  @override
  String get itemId => id;

  @override
  List<Object> get props => [id];

  @override
  bool? get stringify => true;
}
