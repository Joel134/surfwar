import 'package:hive/hive.dart';
import 'package:scapple_notes_app/models/scapple.dart';
part 'note_doc.g.dart';

@HiveType(typeId: 2)
class NoteDoc {
  @HiveField(0)
  List<Scapple> scapples;
  @HiveField(1)
  String id;
  NoteDoc({required this.scapples, required this.id});
}
