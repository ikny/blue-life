import 'package:challenge_android/database/database_communication.dart';
import 'package:challenge_android/models/achievement.dart';
import 'package:flutter/material.dart';

class AchievementsPageState extends ChangeNotifier {
  late Achievement sleep;
  late Achievement movement;
  late Achievement procrastination;
  late Achievement porn;
  late Achievement sex;

  late DatabaseCommunication database;

  AchievementsPageState.myFiveAchievementsFromMap(
      {required Map<String, Achievement> achievements,
      required this.database}) {
    sleep = achievements["sleep"]!;
    movement = achievements["movement"]!;
    procrastination = achievements["procrastination"]!;
    porn = achievements["porn"]!;
    sex = achievements["sex"]!;
  }

  void addToMyFiveAchievements({required Map<String, dynamic> values}) {
    //hardoced af, gonna fix that later #forupdate
    sleep.currentValue += values["hrs_sleep"];
    movement.currentValue += values["hrs_movement"];
    if (values["hrs_procrastination"] < 1) {
      procrastination.currentValue += 1;
    }
    if (values["porn"] == 0) {
      porn.currentValue += 1;
    }
    sex.currentValue += values["sex"];

    saveMyFiveAchievemnts();
  }

  Future<void> saveMyFiveAchievemnts() async {
    await database.insertAchievement(achievement: sleep);
    await database.insertAchievement(achievement: movement);
    await database.insertAchievement(achievement: procrastination);
    await database.insertAchievement(achievement: porn);
    await database.insertAchievement(achievement: sex);
  }
}
