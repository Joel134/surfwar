// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scapple.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScappleAdapter extends TypeAdapter<Scapple> {
  @override
  final int typeId = 3;

  @override
  Scapple read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Scapple(
      color: fields[1] as Color,
      text: fields[0] as String,
      x: fields[2] as double,
      y: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Scapple obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.x)
      ..writeByte(3)
      ..write(obj.y);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScappleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
