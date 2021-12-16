import 'service.dart';
import 'package:path/path.dart' as p;

class HiveInstance {
  static late Box _notesBox;
  static initialiseHive() async {
    await Hive.initFlutter();

    Hive.registerAdapter(ScappleAdapter());
    Hive.registerAdapter(NoteListAdapter());
    Hive.registerAdapter(NoteDocAdapter());
    _notesBox = await Hive.openBox('notesBox');
  }

  static Box get noteBox {
    return _notesBox;
  }
}
