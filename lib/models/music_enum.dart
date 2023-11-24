import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guitar_hero_mir/models/game_note.dart';

enum Music {
  backInBlackACDC
}

extension MusicExtension on Music {

  String get name {
    switch(this) {
      case Music.backInBlackACDC:
        return 'Back In Black';
    }
  }

  String get author {
    switch(this) {
      case Music.backInBlackACDC:
        return 'ACDC';
    }
  }

  int get releaseYear {
    switch(this) {
      case Music.backInBlackACDC:
        return 1980;
    }
  }

  String get filename {
    switch(this) {
      case Music.backInBlackACDC:
        return 'AC_DC__Back_In_Black';
    }
  }

  String get audioPath {
    return "/audio/$filename.mp3";
  }

  Future<List<GameNote>> gameNotes(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context).loadString("assets/game_notes/$filename.json");
    List<dynamic> json = jsonDecode(jsonString);  
    return json.map((e) => GameNote(time: e['time'], tier: e['tier'])).toList();
  }
}
