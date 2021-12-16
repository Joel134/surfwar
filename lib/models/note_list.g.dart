// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteListAdapter extends TypeAdapter<NoteList> {
  @override
  final int typeId = 1;

  @override
  NoteList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NoteList(
      noteDocs: (fields[0] as List).cast<NoteDoc>(),
    );
  }

  @override
  void write(BinaryWriter writer, NoteList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.noteDocs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
