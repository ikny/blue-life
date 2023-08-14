import 'package:challenge_android/models/achievement.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/day.dart';

class DatabaseCommunication {
  late Database database;

  Future<void> initialize() async {
    String path = join(await getDatabasesPath(), "challengedb.db");
    database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute("""CREATE TABLE days(date TEXT PRIMARY KEY NOT NULL, 
          hrs_sleep DOUBLE NOT NULL, hrs_movement DOUBLE NOT NULL, 
          hrs_procrastination DOUBLE NOT NULL, porn INTEGER NOT NULL, 
          sex INTEGER NOT NULL)""");
      await db.execute(
          """CREATE TABLE achievements(name TEXT(20) PRIMARY KEY NOT NULL, 
          title TEXT(20) NOT NULL, current_value DOUBLE NOT NULL, 
          max_value DOUBLE NOT NULL)""");
      //#forupdate: not modular, will probably store in some file...
      await db.insert("achievements", {
        "name": "sleep",
        "title": "Jdi si lehnout!",
        "current_value": 0.0,
        "max_value": 100
      });
      await db.insert("achievements", {
        "name": "movement",
        "title": "Měl bys plavat...",
        "current_value": 0.0,
        "max_value": 100
      });
      await db.insert("achievements", {
        "name": "procrastination",
        "title": "Konec prokrastinace?",
        "current_value": 0.0,
        "max_value": 100
      });
      await db.insert("achievements", {
        "name": "porn",
        "title": "porno",
        "current_value": 0.0,
        "max_value": 100
      });
      await db.insert("achievements", {
        "name": "sex",
        "title": "sex += 1",
        "current_value": 0.0,
        "max_value": 100
      });
    });
  }

  Future<int> insertDay({required Day day}) async {
    return await database.insert("days", day.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertAchievement({required Achievement achievement}) async {
    return await database.insert("achievements", achievement.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // #forupdate: for adding updating and removing in a future update
  /* Future<int> name() async {
    return await database.;
  } */

  Future<Map<DateTime, Day>> getDays() async {
    //#forupdate: this could be written more efficiently and elegantly
    final List<Map<String, dynamic>> maps = await database.query("days");
    Map<DateTime, Day> myMap = {};
    for (Map<String, dynamic> dayValues in maps) {
      myMap[DateTime.parse(dayValues["date"])] = Day.fromMap(rowDB: dayValues);
    }

    return myMap;
  }

  Future<Map<String, Achievement>> getAchievements() async {
    final List<Map<String, dynamic>> maps =
        await database.query("achievements");
    //#forupdate: this could be written more efficiently
    Map<String, Achievement> myMap = {};

    for (Map<String, dynamic> achievementValues in maps) {
      myMap[achievementValues["name"]] =
          Achievement.fromMap(rowDB: achievementValues);
    }

    return myMap;
  }
}
