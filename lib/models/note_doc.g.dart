// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_doc.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteDocAdapter extends TypeAdapter<NoteDoc> {
  @override
  final int typeId = 2;

  @override
  NoteDoc read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteDoc(
      scapples: (fields[0] as List).cast<Scapple>(),
      id: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NoteDoc obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.scapples)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteDocAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
