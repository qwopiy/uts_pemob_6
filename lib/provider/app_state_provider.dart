import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uts_pemob_6/data/anime_list.dart';

class AppStateProvider extends ChangeNotifier {
  late int _health;
  late int _currentAnimeIndex;
  late List<int> _currentAnimeOptions;
  late int _rightAnswer;
  late int _wrongAnswer;
  late bool _answeredCorrectly;
  bool _overlayRequested = false;
  String imageToShow =  '';

  AppStateProvider() {
    resetGame();
  }

  int get health => _health;
  int get currentAnimeIndex => _currentAnimeIndex;
  List<int> get currentAnimeOptions => _currentAnimeOptions;
  int get score => _rightAnswer;
  int get wrong => _wrongAnswer;

  bool get answeredCorrectly => _answeredCorrectly;
  bool get overlayRequested => _overlayRequested;


  static int randomNum(int inclusiveMin, int inclusiveMax) {
    return Random().nextInt(inclusiveMax + 1 - inclusiveMin) + inclusiveMin;
  }

  static String getAnimeName(int id) {
    return AnimeList.animeList.firstWhere((anime) => anime.id == "$id").name;
  }

  static String getAnimeSynopsis(int id) {
    return AnimeList.animeList.firstWhere((anime) => anime.id == "$id").synopsis;
  }

  static String getAnimeImageURL(int id) {
    return AnimeList.animeList.firstWhere((anime) => anime.id == "$id").imageURL;
  }

  static String getAnimeAirDate(int id) {
    return AnimeList.animeList.firstWhere((anime) => anime.id == "$id").aired;
  }

  static String getAnimeEpisodes(int id) {
    return AnimeList.animeList.firstWhere((anime) => anime.id == "$id").episodes;
  }

  void randomAnime() {
    _currentAnimeIndex = randomNum(0, AnimeList.animeList.length - 1);
  }

  List<String> buildOptions() {
    final n = AnimeList.animeList.length;
    if (n == 0) {
      _currentAnimeOptions = [];
      _currentAnimeIndex = 0;
      return <String>[];
    }

    randomAnime();

    final Set<int> optionSet = {_currentAnimeIndex};

    final target = n >= 4 ? 4 : n;
    while (optionSet.length < target) {
      final rand = randomNum(0, n - 1);
      optionSet.add(rand);
    }

    final options = optionSet.toList();
    options.shuffle();

    _currentAnimeOptions = options;

    return _currentAnimeOptions
        .map((index) => AnimeList.animeList[index].name)
        .toList();
  }

  void checkAnswer(int option) {
    if (_currentAnimeOptions[option] == _currentAnimeIndex) {
      _rightAnswer += 1;
      _answeredCorrectly = true;
    } else {
      _wrongAnswer += 1;
      _health -= 1;
      _answeredCorrectly = false;
    }

    // prepare overlay payload and request UI to show it
    imageToShow = getAnimeImageURL(_currentAnimeIndex);
    _overlayRequested = true;
    notifyListeners();
  }

  void resetGame() {
    // initialize all late fields to safe defaults
    _health = 3;
    _currentAnimeIndex = 0;
    _currentAnimeOptions = [];
    _rightAnswer = 0;
    _wrongAnswer = 0;
    _answeredCorrectly = false;

    buildOptions();
    notifyListeners();
  }

  void nextQuestion() {
    buildOptions();
    notifyListeners();
  }

  /// Called by the UI to clear the overlay request after it has been shown.
  void clearOverlayRequest() {
    _overlayRequested = false;
    imageToShow = '';
    notifyListeners();
  }
}