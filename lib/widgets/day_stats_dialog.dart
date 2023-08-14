import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/calendar.dart';

class DayStatsDialog extends StatelessWidget {
  final DateTime selectedDay;

  const DayStatsDialog({super.key, required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    var calendarState = context.watch<Calendar>();
    var today = calendarState.days[selectedDay]!;
    return Dialog(
      child: Column(
        children: [
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
            child: Text("Dnes jsi měl ${today.sex} krát sex"),
          ),
        ],
      ),
    );
  }
}
