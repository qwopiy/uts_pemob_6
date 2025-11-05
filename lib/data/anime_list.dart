import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import '/models/anime.dart';

class AnimeList {
  static Future<List<Anime>> loadAnimeList() async {
    final String jsonString = await rootBundle.loadString('assets/data/anime_list.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((item) => Anime.fromJson(item)).toList();
  }
}