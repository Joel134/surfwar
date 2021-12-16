import 'package:hive/hive.dart';
import 'package:scapple_notes_app/models/note_doc.dart';
part 'note_list.g.dart';

@HiveType(typeId: 1)
class NoteList {
  @HiveField(0)
  List<NoteDoc> noteDocs;
  NoteList({required this.noteDocs});
}
