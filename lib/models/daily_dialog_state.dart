import 'package:challenge_android/models/achievements_page_state.dart';
import 'package:challenge_android/models/calendar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DailyDialogState extends ChangeNotifier {
  late String hrsSleep = "";
  late String hrsMovement = "";
  late String hrsProcrastination = "";
  late String porn = "";
  late String sex = "";

  DailyDialogState();

  void save(
      {required Calendar calendarState,
      required AchievementsPageState achievementsPageState}) {
    var todaysDate = normalizeDate(DateTime.now());
    var values = {
      "date": todaysDate,
      "hrs_sleep": double.parse(hrsSleep),
      "hrs_movement": double.parse(hrsMovement),
      "hrs_procrastination": double.parse(hrsProcrastination),
      "porn": int.parse(porn),
      "sex": int.parse(sex),
    };

    // if we are upodating the day, first substract its values from the achievements:
    if (calendarState.days.keys.contains(todaysDate)) {
      var today = calendarState.days[todaysDate]!;
      achievementsPageState.sleep.currentValue -= today.hrsSleep;
      achievementsPageState.movement.currentValue -= today.hrsMovement;
      if (today.hrsProcrastination < 2) {
        achievementsPageState.procrastination.currentValue -= 1;
      }
      if (today.porn == false) {
        achievementsPageState.porn.currentValue -= 1;
      }
      achievementsPageState.sex.currentValue -= today.sex;
    }

    calendarState.addDay(values: values);
    achievementsPageState.addToMyFiveAchievements(values: values);
  }

  void updateField({required String name, required String value}) {
    switch (name) {
      case "hrsSleep":
        hrsSleep = value;
        break;
      case "hrsMovement":
        hrsMovement = value;
        break;
      case "hrsProcrastination":
        hrsProcrastination = value;
        break;
      case "porn":
        porn = value;
        break;
      case "sex":
        sex = value;
        break;
    }
  }
}
