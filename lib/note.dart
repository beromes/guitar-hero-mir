import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final double size;
  final Color color;

  const Note({Key? key, required this.size, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(size)),
        border: Border.all(width: 2.0, color: Colors.white),
        color: color,
                
      ),
      width: size,
      height: size,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(size)),
            border: Border.all(width: 2.0, color: Colors.black),
            color: Colors.white
          ),
        ),
      )
    );
  }
}
