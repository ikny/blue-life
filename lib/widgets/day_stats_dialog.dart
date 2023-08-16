import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/calendar.dart';

class DayStatsDialog extends StatelessWidget {
  final DateTime selectedDay;

  const DayStatsDialog({super.key, required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    var calendarState = context.watch<Calendar>();
    if (!calendarState.days.containsKey(selectedDay)) {
      return Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${selectedDay.day}.${selectedDay.month}.${selectedDay.year}",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Pro tento den nejsou k dispozici žádná data."),
            ),
          ],
        ),
      );
    }
    var today = calendarState.days[selectedDay]!;

    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${selectedDay.day}.${selectedDay.month}.${selectedDay.year}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Spal jsi ${today.hrsSleep} hodin"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Hýbal ses ${today.hrsMovement} hodin"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Prokrastinoval jsi ${today.hrsProcrastination} hodin"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Koukal jsi na porno? ${today.porn}"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Měl jsi ${today.sex} krát sex"),
          ),
        ],
      ),
    );
  }
}
