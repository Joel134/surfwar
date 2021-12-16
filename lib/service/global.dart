import 'package:hive/hive.dart';
import 'package:scapple_notes_app/service/hive.dart';

enum BOX_NAME { NOTE_BOX }

class Global {
  static final hiveRepoStoragePath = 'notes';

  static final Map<BOX_NAME, Box> boxes = {
    BOX_NAME.NOTE_BOX: HiveInstance.noteBox,
  };
}
