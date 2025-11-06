import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uts_pemob_6/data/anime_list.dart';

import '../models/user.dart';

class AppStateProvider extends ChangeNotifier {
  late User user;
  late int _health;
  late int _coins = 0;
  late int _totalCoinsUsed = 0;
  late int _currentAnimeIndex;
  late List<int> _currentAnimeOptions;
  late int _rightAnswer;
  late int _wrongAnswer;
  late bool _answeredCorrectly;
  String imageToShow = '';
  String message = '';

  AppStateProvider() {
    User(
      name: 'User',
      correct: 0,
      wrong: 0,
      coins: 0,
      totalCoinsUsed: 0,
    );
    resetGame();
  }

  int get health => _health;
  int get coins => _coins;

  int get currentAnimeIndex => _currentAnimeIndex;

  List<int> get currentAnimeOptions => _currentAnimeOptions;

  int get score => _rightAnswer;

  int get wrong => _wrongAnswer;

  bool get answeredCorrectly => _answeredCorrectly;

  int get totalCoinsUsed => _totalCoinsUsed;


  static int randomNum(int inclusiveMin, int inclusiveMax) {
    return Random().nextInt(inclusiveMax + 1 - inclusiveMin) + inclusiveMin;
  }

  static String getAnimeName(int id) {
    return AnimeList.animeList
        .firstWhere((anime) => anime.id == "$id")
        .name;
  }

  static String getAnimeSynopsis(int id) {
    return AnimeList.animeList
        .firstWhere((anime) => anime.id == "$id")
        .synopsis;
  }

  static String getAnimeImageURL(int id) {
    return AnimeList.animeList
        .firstWhere((anime) => anime.id == "$id")
        .imageURL;
  }

  static String getAnimeAirDate(int id) {
    return AnimeList.animeList
        .firstWhere((anime) => anime.id == "$id")
        .aired;
  }

  static String getAnimeEpisodes(int id) {
    return AnimeList.animeList
        .firstWhere((anime) => anime.id == "$id")
        .episodes;
  }

  void randomAnime() {
    _currentAnimeIndex = randomNum(0, AnimeList.animeList.length - 1);
  }

  List<String> buildOptions() {
    randomAnime();
    _currentAnimeOptions = [];
    _currentAnimeOptions.add(_currentAnimeIndex);

    while (_currentAnimeOptions.length < 4) {
      int option = randomNum(1, AnimeList.animeList.length - 1);
      if (!_currentAnimeOptions.contains(option)) {
        _currentAnimeOptions.add(option);
      }
    }

    _currentAnimeOptions.shuffle();
    print('Current Anime Index: $_currentAnimeIndex');
    print('Current Anime chosen: ${AnimeList.animeList
        .firstWhere((anime) => anime.id == "$_currentAnimeIndex")
        .name}');

    return _currentAnimeOptions.map((e) => getAnimeName(e)).toList();
  }

  void setCorrectMessage(int option) {
    String animeName = getAnimeName(option);
    message = "Benar, judul animenya adalah " + animeName;
  }

  void setWrongMessage(int option) {
    String animeName = getAnimeName(option);
    message = "Salah, judul animenya harusnya " + animeName;
  }

  void checkAnswer(int option) {
    if (_currentAnimeOptions[option] == _currentAnimeIndex) {
      _rightAnswer += 1;
      _coins += 1;
      _answeredCorrectly = true;
      setCorrectMessage(_currentAnimeIndex);
    } else {
      _wrongAnswer += 1;
      _health -= 1;
      _answeredCorrectly = false;
      setWrongMessage(_currentAnimeIndex);
    }

    imageToShow = getAnimeImageURL(_currentAnimeIndex);
    notifyListeners();
  }

  void resetGame() {
    _health = 3;
    _currentAnimeIndex = 0;
    _currentAnimeOptions = [];
    _rightAnswer = 0;
    _wrongAnswer = 0;
    _answeredCorrectly = false;

    notifyListeners();
  }

  void useCoin(int amount, int price) {
    if (_coins < price)
      return;
    if (_coins >= amount) {
      _coins -= amount;
      _totalCoinsUsed += amount;
      notifyListeners();
    }
  }

  void updateUser() {
    user = User(
      name: user.name,
      correct: _rightAnswer,
      wrong: _wrongAnswer,
      coins: _coins,
      totalCoinsUsed: _totalCoinsUsed,
    );
  }

  void changeUserName(String newName) {
    user = User(
      name: newName,
      correct: user.correct,
      wrong: user.wrong,
      coins: user.coins,
      totalCoinsUsed: user.totalCoinsUsed,
    );
    notifyListeners();
  }
}