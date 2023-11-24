import 'package:flutter/material.dart';
import 'package:guitar_hero_mir/models/game_note.dart';
import 'package:guitar_hero_mir/models/music_enum.dart';
import 'package:guitar_hero_mir/screens/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            title(),
            Expanded(child: musics()),
          ],
        ),
      )

    );
  }

  Widget title() {
    return const Column(
      children: [
        Text("GUITAR MIR'O"),
        Text('Selecione uma música')
      ],
    );
  }

  Widget musics() {
    return ListView.separated(
      itemBuilder: (ctx, i) {
        Music music = Music.values[i];
        return ListTile(
          title: Text(music.name),
          subtitle: Text('${music.author} - ${music.releaseYear}'),
          trailing: IconButton(
            icon: const Icon(Icons.play_arrow),
            onPressed: () => selectMusic(music, ctx),
          ),
        );
      },  
      separatorBuilder: (ctx, i) => const SizedBox(height: 12), 
      itemCount: Music.values.length
    );
  }

  selectMusic(Music music, BuildContext context) async {
    List<GameNote> notes = await music.gameNotes(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GameScreen(music: music, notes: notes)),
    );
  }
}
