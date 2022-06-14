import 'package:test_template/src/features/core/domain/entities/entity.dart';

/// The SettingID is an important concept in our domain
/// so it deserves a type of its own
typedef SettingID = String;

class SettingEntity implements Entity {
  const SettingEntity({
    required this.id,
    required this.image,
    required this.name,
  });

  final SettingID id;
  final String image;
  final String name;

  @override
  String get itemId => id;

  @override
  List<Object> get props => [id];

  @override
  bool? get stringify => true;
}
