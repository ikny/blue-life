import 'package:challenge_android/models/achievement.dart';
import 'package:flutter/material.dart';

class AchievementBar extends StatelessWidget {
  final Achievement state;
  const AchievementBar({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        color: Theme.of(context).colorScheme.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(state.title),
                ),
                IconButton(
                  onPressed: (() => showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(state.description),
                            ),
                          ))),
                  icon: const Icon(Icons.info),
                )
              ],
            ),
            LinearProgressIndicator(
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              value: state.currentValue / state.maxValue,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${state.currentValue}/${state.maxValue}"),
            ),
          ],
        ));
  }
}
