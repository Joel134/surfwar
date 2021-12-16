import 'package:flutter/material.dart';
import 'package:scapple_notes_app/styles/fonts.dart';

class DragBoxWidget extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;

  const DragBoxWidget(this.initPos, this.label, this.itemColor);

  @override
  DragBoxWidgetState createState() => DragBoxWidgetState();
}

class DragBoxWidgetState extends State<DragBoxWidget> {
  Offset position = const Offset(300.0, 300.0);

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: position.dx,
        top: position.dy,
        child: Draggable(
          data: widget.itemColor,
          child: Container(
            width: 200,
            height: 150,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: widget.itemColor,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            child: TextFormField(
              cursorHeight: 18,
              enabled: true,
              maxLines: 2,
              onEditingComplete: () {},
              initialValue: widget.label,
              style: AppFonts.secondaryText,
              decoration: InputDecoration(
                hintText: 'Enter your Text here',
                hintStyle: AppFonts.hintText,
                isDense: true,
                filled: true,
                border: InputBorder.none,
              ),
              onChanged: (value) {},
            ),
          ),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              position = offset;
            });
          },
          feedback: Container(
            width: 120.0,
            height: 120.0,
            color: widget.itemColor.withOpacity(0.5),
            child: Center(
              child: Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ));
  }
}
