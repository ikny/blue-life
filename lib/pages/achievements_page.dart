import 'package:challenge_android/models/achievements_page_state.dart';
import 'package:challenge_android/widgets/achievement_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AchievementsPage extends StatelessWidget {
  const AchievementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AchievementsPageState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Achievements"),
      ),
      body: Center(
          child: Column(
        children: [
          AchievementBar(
            state: state.sleep,
          ),
          AchievementBar(
            state: state.movement,
          ),
          AchievementBar(
            state: state.procrastination,
          ),
          AchievementBar(
            state: state.porn,
          ),
          AchievementBar(
            state: state.sex,
          )
        ],
      )),
    );
  }
}
