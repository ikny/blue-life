import 'package:challenge_android/database/database_communication.dart';
import 'package:challenge_android/models/day.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends ChangeNotifier {
  final DateTime focusedDay = normalizeDate(DateTime.now());
  late DateTime firstDay;
  final DateTime lastDay = normalizeDate(DateTime.now());

  late Map<DateTime, Day> days;
  late DatabaseCommunication database;

  Calendar({required this.days, required this.database}) {
    firstDay = focusedDay.subtract(Duration(days: days.length));
  }

  Future<void> addDay({required Map<String, dynamic> values}) async {
    var day = Day.fromMap(rowDB: values);
    days[values["date"]] = day;
    await database.insertDay(day: day);
  }
}
