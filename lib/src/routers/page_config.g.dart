// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PageConfigAdapter extends TypeAdapter<PageConfig> {
  @override
  final int typeId = 1;

  @override
  PageConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PageConfig(
      location: fields[0] as String,
      args: (fields[2] as Map?)?.cast<String, dynamic>(),
      name: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PageConfig obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.args);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
