import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guitar_hero_mir/widgets/note_base.dart';
import 'note.dart';

class GuitarRow extends StatefulWidget {
  final Color color;
  final double size;
  final LogicalKeyboardKey keyboardKey;
  final Stream<RawKeyEvent> keyboardStream;
  late final double endTime;
  late final List<double> notesPositions;

  GuitarRow({Key? key, required List<double> times, required this.color, required this.keyboardKey, required this.keyboardStream, this.size = 80.0}) : super(key: key) {
    endTime = times.isEmpty ? 0 : times.reduce(max);
    notesPositions = getNotesPositions(times);
  }

  @override
  State<GuitarRow> createState() => _GuitarRowState();


  List<double> getNotesPositions(List<double> times) {
    return times.map((e) => e * size).toList();
  }
}

class _GuitarRowState extends State<GuitarRow> {

  late Timer timer;
  int time = -10;

  @override
  void initState() {
    super.initState();
    initTimer();
    widget.keyboardStream.listen((event) { 
      if (event.isKeyPressed(LogicalKeyboardKey.space)) {
        pause();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  void initTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time >= widget.endTime) timer.cancel();
      setState(() {
        time += 1;
      });
    });
  }

  void pause() {
    if (timer.isActive) {
      timer.cancel();
    } else {
      initTimer();
    }
  }

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
            child: NoteBase(
              color: widget.color,
              keyboardKey: widget.keyboardKey,
              keyboardStream: widget.keyboardStream,
              size: widget.size,
            ),
          ),
          ...widget.notesPositions.map(
            (position) => AnimatedPositioned(
              duration: const Duration(seconds: 1),
              bottom: position - (widget.size * time),
              child: Note(color: widget.color, size: widget.size - 10),
            )
          ).toList()
        ],
      ),
    );
  }
}
