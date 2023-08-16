import 'package:challenge_android/models/achievement.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:table_calendar/table_calendar.dart';

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
          title TEXT(20) NOT NULL, description TEXT(50) NOT NULL, current_value DOUBLE NOT NULL, 
          max_value DOUBLE NOT NULL)""");
      //#forupdate: not modular, will probably store in some file...
      await db.insert("achievements", {
        "name": "sleep",
        "title": "Jdi si lehnout!",
        "description": """Zobrazuje prospané hodiny.
        Zatím žádné milníky.""",
        "current_value": 27.5,
        "max_value": 28 * 6 * 8.5
      });
      await db.insert("achievements", {
        "name": "movement",
        "title": "Měl bys plavat...",
        "description": """Zobrazuje hodiny strávené pohybem.
        Milníky: 20, 50, 80, 120, 150, 200, 250, 300, 350""",
        "current_value": 5.7,
        "max_value": 350
      });
      await db.insert("achievements", {
        "name": "procrastination",
        "title": "Konec prokrastinace?",
        "description":
            """Zobrazuje počet dní s méně než jednou hodinou prokrastinace.
        Milníky: 10, 15, 30, 50, 70, 90, 110, 140, 160""",
        "current_value": 2,
        "max_value": 160
      });
      await db.insert("achievements", {
        "name": "porn",
        "title": "porno",
        "description": """Zobrazuje počet pornaprostých dní.
        Milníky: 10, 20, 40, 60, 80, 100, 120, 140, 160""",
        "current_value": 2,
        "max_value": 160
      });
      await db.insert("achievements", {
        "name": "sex",
        "title": "sex += 1",
        "description": """Zobrazuje počet aktů.
        Milníky: 10, 25, 40, 55, 70""",
        "current_value": 1,
        "max_value": 70
      });

      await db.insert("days", {
        "date": normalizeDate(DateTime(2023, 8, 13)).toIso8601String(),
        "hrs_sleep": 9,
        "hrs_movement": 1,
        "hrs_procrastination": 0,
        "porn": 0,
        "sex": 0,
      });
      await db.insert("days", {
        "date": normalizeDate(DateTime(2023, 8, 14)).toIso8601String(),
        "hrs_sleep": 8.5,
        "hrs_movement": 2.7,
        "hrs_procrastination": 1.5,
        "porn": 1,
        "sex": 1,
      });
      await db.insert("days", {
        "date": normalizeDate(DateTime(2023, 8, 15)).toIso8601String(),
        "hrs_sleep": 10,
        "hrs_movement": 2,
        "hrs_procrastination": 0.95,
        "porn": 0,
        "sex": 0,
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
