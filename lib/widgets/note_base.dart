import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteBase extends StatefulWidget {
  final Color color;
  final double size;
  final LogicalKeyboardKey keyboardKey;

  const NoteBase({Key? key, required this.color, required this.size, required this.keyboardKey}) : super(key: key);

  @override
  State<NoteBase> createState() => _NoteBaseState();
}

class _NoteBaseState extends State<NoteBase> {

  bool pressed = false;

  @override
  Widget build(BuildContext context) {

    if (pressed) {
      setState(() {
        pressed = false;
      });
    }

    // return RawKeyboardListener(
    //   autofocus: true,
    //   focusNode: FocusNode(),
    //  child: Container(
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(widget.size)),
          border: Border.all(width: 2.0, color: widget.color),
          color: Colors.black,
        ),
        width: widget.size,
        height: widget.size,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(widget.size)),
              color: pressed ? widget.color : Colors.grey.withOpacity(0.5),
            ),
          ),
        )
      );
      // onKey: (event) {
      //   if (event.isKeyPressed(widget.keyboardKey)) {
      //     print('pressed');
      //     setState(() {
      //       pressed = true;
      //     });
      //   }
      // },
    // );
  }
}
