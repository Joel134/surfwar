import 'package:flutter/material.dart';
import 'package:scapple_notes_app/models/scapple.dart';
import 'package:scapple_notes_app/service/service.dart';
import 'scapple_page_components/drag_box_widget.dart';

class ScapplePage extends StatefulWidget {
  List<Scapple> scapples;
  String id;
  int index;
  ScapplePage(
      {Key? key, required this.id, required this.index, required this.scapples})
      : super(key: key);

  @override
  State<ScapplePage> createState() => _ScapplePageState();
}

class _ScapplePageState extends State<ScapplePage> {
  final ScrollController verticalScroll = ScrollController();

  final ScrollController horizontalScroll = ScrollController();
  bool dragStarted = false;

  @override
  Widget build(BuildContext context) {
    List<Scapple> scapple = widget.scapples;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ValueListenableBuilder(
            valueListenable: Global.boxes[BOX_NAME.NOTE_BOX]!.listenable(),
            builder: (context, Box box, _) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    controller: ScrollController(initialScrollOffset: 200),
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      controller: ScrollController(initialScrollOffset: 200),
                      scrollDirection: Axis.horizontal,
                      child: InteractiveViewer(
                        maxScale: 20,
                        minScale: 1,
                        alignPanAxis: true,
                        child: GridPaper(
                          child: Container(
                            height: 5000,
                            width: 5000,
                            color: Colors.grey[200],
                            child: Stack(
                              children: [
                                ...scapple
                                    .map((e) => DragBoxWidget(
                                        Offset(e.x, e.y), e.text, e.color))
                                    .toList()
                              ],
                            ),
                          ),
                          color: Colors.grey,
                          interval: 500,
                          subdivisions: 10,
                          divisions: 4,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 30,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          scapple.add(Scapple(
                              color: Colors.black,
                              text: '',
                              x: (200 + scapple.length * 40),
                              y: 200));
                        });
                        Global.boxes[BOX_NAME.NOTE_BOX]!.putAt(widget.index + 1,
                            NoteDoc(id: widget.id, scapples: scapple));
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.add,
                          size: 26,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.home_outlined,
                          size: 26,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
