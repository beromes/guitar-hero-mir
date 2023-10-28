import 'package:flutter/material.dart';
import 'package:guitar_hero_mir/note_base.dart';

import 'note.dart';

class GuitarRow extends StatefulWidget {
  final Color color;
  final double size;

  const GuitarRow({Key? key, required this.color, this.size = 80.0}) : super(key: key);

  @override
  State<GuitarRow> createState() => _GuitarRowState();
}

class _GuitarRowState extends State<GuitarRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      width: widget.size,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 15.0,
            child: NoteBase(color: widget.color, size: widget.size),
          ),
          Positioned(
            top: 0.0,
            child: Note(color: widget.color, size: widget.size - 10),
          ),
          Positioned(
            top: 100.0,
            child: Note(color: widget.color, size: widget.size - 10),
          ),
        ],
      ),
    );
  }
}
