import 'package:challenge_android/database/database_communication.dart';
import 'package:challenge_android/models/achievements_page_state.dart';
import 'package:challenge_android/models/calendar.dart';
import 'package:challenge_android/models/daily_dialog_state.dart';
import 'package:challenge_android/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/achievement.dart';
import 'models/day.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dbCom = DatabaseCommunication();
  await dbCom.initialize();
  var days = await dbCom.getDays();
  var achievements = await dbCom.getAchievements();

  runApp(MainApp(
    days: days,
    achievements: achievements,
    database: dbCom,
  ));
}

class MainApp extends StatelessWidget {
  final Map<DateTime, Day> days;
  final Map<String, Achievement> achievements;
  final DatabaseCommunication database;

  const MainApp(
      {super.key,
      required this.days,
      required this.achievements,
      required this.database});

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: ((context) =>
                  AchievementsPageState.myFiveAchievementsFromMap(
                      achievements: achievements, database: database))),
          ChangeNotifierProvider(
              create: (context) => Calendar(
                    days: days,
                    database: database,
                  )),
          ChangeNotifierProvider(create: ((context) => DailyDialogState())),
        ],
        child: MaterialApp(
            title: "Challenge App",
            theme: ThemeData.from(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color.fromARGB(255, 9, 179, 9))),
            home: const HomePage()),
      );
}
