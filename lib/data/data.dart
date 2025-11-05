import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/anime.dart';
import '../models/user.dart';

class Data {
  Future<Database> openDatabaseConnection() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'data.sqlite');

    if (!await databaseExists(path)) {
      final data = await rootBundle.load('assets/databases/data.sqlite');
      final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    }

    return openDatabase(path);
  }

  Future<List<Anime>> getAnimeList() async {
    final db = await openDatabaseConnection();
    final List<Map<String, dynamic>> maps = await db.query('anime_list');

    return List.generate(maps.length, (i) => Anime.fromMap(maps[i]));
  }

  Future<List<User>> getUserData() async {
    final db = await openDatabaseConnection();
    final List<Map<String, dynamic>> maps = await db.query('user');

    return List.generate(maps.length, (i) => User.fromMap(maps[i]));
  }

  Future updateUserData(User user) async {
    final db = await openDatabaseConnection();

    await db.update(
      'user',
      {
        'name': user.name,
        'correct': user.correct,
        'wrong': user.wrong,
        'coins': user.coins,
        'total_coins_used': user.totalCoinsUsed
      },
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future insertUserData(User user) async {
    final db = await openDatabaseConnection();

    await db.insert(
      'user',
      {
        'name': user.name,
        'correct': user.correct,
        'wrong': user.wrong,
        'coins': user.coins,
        'total_coins_used': user.totalCoinsUsed
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
