import 'package:challenge_android/pages/achievements_page.dart';
import 'package:challenge_android/pages/rules_page.dart';
import 'package:challenge_android/widgets/daily_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/calendar.dart';
import '../widgets/day_stats_dialog.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var calendarState = context.watch<Calendar>();
    return Scaffold(
      appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Půlroční výzva"),
          Tooltip(
            message: "Pravidla",
            child: IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RulesPage())),
                icon: const Icon(Icons.info)),
          ),
        ],
      )),
      body: Center(
        child: TableCalendar(
          focusedDay: calendarState.focusedDay,
          firstDay: calendarState.firstDay,
          lastDay: calendarState.lastDay,
          onDayLongPressed: (selectedDay, focusedDay) => showDialog(
            context: context,
            builder: (context) => DailyDialog(
              selectedDay: selectedDay,
            ),
          ),
          onDaySelected: (selectedDay, focusedDay) => showDialog(
              context: context,
              builder: (context) => DayStatsDialog(
                    selectedDay: selectedDay,
                  )),
          //#TODO on range selected: implement counting week summary
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) => const AchievementsPage())),
        icon: const Icon(Icons.analytics),
        tooltip: "Achievements",
      ),
    );
  }
}
