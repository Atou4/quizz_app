
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/views/home/home_screen.dart';
import 'package:quizz_app/views/leaderboard/leaderboard_screen.dart';
import 'package:quizz_app/views/profile/profile_screen.dart';

var indexProvider = StateProvider((ref) => 0);

class Botnavbar extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(indexProvider),
        children: [HomeScreen(), LeaderboardScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(indexProvider),
        onTap: (index) {
          ref.read(indexProvider.state).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon:  FaIcon(FontAwesomeIcons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon:  FaIcon(FontAwesomeIcons.trophy),
            label: "Leaderboard",
          ),
          BottomNavigationBarItem(
            icon:  FaIcon(FontAwesomeIcons.solidUser),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
