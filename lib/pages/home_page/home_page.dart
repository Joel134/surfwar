import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scapple_notes_app/models/note_doc.dart';
import 'package:scapple_notes_app/pages/scapple_page/scapple_page.dart';
import 'package:scapple_notes_app/service/global.dart';
import 'package:scapple_notes_app/service/utils.dart';
import 'package:scapple_notes_app/styles/fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final String id = Utils.getSecureString(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey,
      body: ValueListenableBuilder(
          valueListenable: Global.boxes[BOX_NAME.NOTE_BOX]!.listenable(),
          builder: (context, Box box, _) {
            List<NoteDoc>? noteDoc =
                box.keys.map((e) => box.get(e) as NoteDoc).toList();

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 32,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/Icon.png',
                          scale: 0.8,
                        ),
                        Text(
                          'Scapple App',
                          style: AppFonts.primaryText,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'All boards',
                    style: AppFonts.primaryText.copyWith(fontSize: 26),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      GestureDetector(
                        onTap: () {
                          box.put(id, NoteDoc(id: id, scapples: []));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScapplePage(
                                        id: id,
                                        index: noteDoc
                                            .indexWhere((e) => e.id == id),
                                        scapples: [],
                                      )));
                        },
                        child: Container(
                          height: 150,
                          width: 120,
                          decoration: const BoxDecoration(
                              color: Colors.yellow,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.add,
                                size: 25,
                              ),
                              Text('Create New ')
                            ],
                          ),
                        ),
                      ),
                      if (noteDoc != null)
                        ...noteDoc
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  print(noteDoc.indexOf(e));
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ScapplePage(
                                              id: e.id,
                                              scapples: e.scapples,
                                              index: noteDoc.indexOf(e))));
                                },
                                child: Container(
                                  height: 150,
                                  width: 120,
                                  child:
                                      const Center(child: Text('Untitles Doc')),
                                  decoration: const BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16))),
                                ),
                              ),
                            )
                            .toList()
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
