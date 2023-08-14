import 'package:challenge_android/models/achievements_page_state.dart';
import 'package:challenge_android/models/daily_dialog_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/calendar.dart';

class DailyDialog extends StatelessWidget {
  const DailyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var calendarState = context.watch<Calendar>();
    var achievementsPageState = context.watch<AchievementsPageState>();
    var dailyDialogState = context.watch<DailyDialogState>();
    return Dialog(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //#TODO implement getting the data, then call calendar.addDay(data) and achs += data
          InputRow(
            name: "hrsSleep",
            text: "Kolik hodin jsi spal?",
            dailyDialogState: dailyDialogState,
          ),
          InputRow(
            name: "hrsMovement",
            text: "Kolik hodin jsi sportoval?",
            dailyDialogState: dailyDialogState,
          ),
          InputRow(
            name: "hrsProcrastination",
            text: "Kolik hodin jsi prokrastinoval?",
            dailyDialogState: dailyDialogState,
          ),
          InputRow(
            name: "porn",
            text: "Koukal jsi na porno? (zadej 0 nebo 1)",
            dailyDialogState: dailyDialogState,
          ),
          InputRow(
            name: "sex",
            text: "Kolikrát jsi měl sex?",
            dailyDialogState: dailyDialogState,
          ),
          ElevatedButton(
              onPressed: () => {
                    dailyDialogState.save(
                        calendarState: calendarState,
                        achievementsPageState: achievementsPageState),
                    Navigator.pop(context)
                  },
              child: const Text("Uložit"))
        ],
      ),
    );
  }
}

class InputRow extends StatelessWidget {
  final String name;
  final String text;
  final DailyDialogState dailyDialogState;

  const InputRow({
    super.key,
    required this.name,
    required this.text,
    required this.dailyDialogState,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        SizedBox(
          width: 40,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: (String value) =>
                dailyDialogState.updateField(name: name, value: value),
          ),
        ),
      ],
    );
  }
}
