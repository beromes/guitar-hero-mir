import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guitar_hero_mir/models/game_note.dart';
import 'package:guitar_hero_mir/models/music_enum.dart';
import 'package:guitar_hero_mir/widgets/guitar_row.dart';

class GameScreen extends StatefulWidget {
  final Music music;
  final List<GameNote> notes;

  const GameScreen({Key? key, required this.music, required this.notes}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();

  static Widget divider() => Container(
    width: 1.0,
    height: double.infinity,
    color: Colors.black,
  );
}

class _GameScreenState extends State<GameScreen> {

  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {        
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('${widget.music.name} - ${widget.music.author}'),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () => Navigator.of(context).pop()
        ),
      ),
      backgroundColor: Colors.purple.withOpacity(0.5),
      body: Center(       
        // child: Transform(
        //   transform: Matrix4.identity()
        //     ..setEntry(3, 2, 0.001)
        //     ..rotateX(-45),
        //   alignment: FractionalOffset.center,
          child: Container(
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                )
              )
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GuitarRow(times: getNoteTimes(0), color: Colors.green, keyboardKey: LogicalKeyboardKey.keyA),
                GameScreen.divider(),
                GuitarRow(times: getNoteTimes(1), color: Colors.red, keyboardKey: LogicalKeyboardKey.keyS),
                GameScreen.divider(),
                GuitarRow(times: getNoteTimes(2), color: Colors.yellow, keyboardKey: LogicalKeyboardKey.keyJ),
                GameScreen.divider(),
                GuitarRow(times: getNoteTimes(3), color: Colors.lightBlue, keyboardKey: LogicalKeyboardKey.keyK),
                GameScreen.divider(),
                GuitarRow(times: getNoteTimes(4), color: Colors.orange, keyboardKey: LogicalKeyboardKey.keyL),
              ]
            ),
          ),
        // ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    Source source = AssetSource(widget.music.audioPath);
    player.play(source);
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  List<double> getNoteTimes(int tier) => widget.notes
    .where((n) => n.tier == tier)
    .map((n) => n.time)
    .toList();
}
