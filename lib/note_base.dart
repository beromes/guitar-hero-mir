import 'package:flutter/material.dart';

class NoteBase extends StatefulWidget {
  final Color color;
  final double size;

  const NoteBase({Key? key, required this.color, required this.size}) : super(key: key);

  @override
  State<NoteBase> createState() => _NoteBaseState();
}

class _NoteBaseState extends State<NoteBase> {
  @override
  Widget build(BuildContext context) {
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
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      )
    );
  }
}
