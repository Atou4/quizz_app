import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/views/home/home_screen.dart';
import 'package:quizz_app/views/profile/profile_screen.dart';

var indexProvider = StateProvider((ref) => 0);

class Botnavbar extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: IndexedStack(
        index: ref.watch(indexProvider),
        children: [HomeScreen(), HomeScreen(), HomeScreen(), ProfileScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ref.watch(indexProvider),
        onTap: (index) {
          ref.read(indexProvider.state).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(Icons.chat_bubble_outline),
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: const Padding(
              padding: EdgeInsets.only(left: 5),
              child: Icon(CupertinoIcons.gamecontroller),
            ),
            label: "Quiz",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
