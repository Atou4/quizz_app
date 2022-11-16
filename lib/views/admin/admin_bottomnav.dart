import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/utils/app_colors.dart';
import 'package:quizz_app/views/profile/profile_screen.dart';

import 'add_quiz/add_quiz._screen.dart';
import 'home/admin_home.dart';

var indexProvider = StateProvider((ref) => 0);

class AdminBotnavbar extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar:MediaQuery.of(context).size.width < 640?
       BottomNavigationBar(
        currentIndex: ref.watch(indexProvider),
        onTap: (index) {
          ref.read(indexProvider.state).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidUser),
            label: "Profile",
          ),
        ],
      ):null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:MediaQuery.of(context).size.width < 640? FloatingActionButton(
        splashColor: AppColors.grey,
        backgroundColor: AppColors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddQuizz();
              },
            ),
          );
        },
        child: FaIcon(
          FontAwesomeIcons.plus,
          color: AppColors.lightblue,
        ),
      ):null,
      body: 
      (MediaQuery.of(context).size.width >= 640)?
      Row(
        children: [
          NavigationRail(
            onDestinationSelected: (index) {
              ref.read(indexProvider.state).state = index;
            },
            destinations: [
              const NavigationRailDestination(
                  icon: FaIcon(FontAwesomeIcons.house),
                  label: Text(
                    "Home",
                  )),
              NavigationRailDestination(
                icon: FloatingActionButton(
                  splashColor: AppColors.grey,
                  backgroundColor: AppColors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddQuizz();
                        },
                      ),
                    );
                  },
                  child: FaIcon(
                    FontAwesomeIcons.plus,
                    color: AppColors.lightblue,
                  ),
                ),
                label: Text(""),
              ),
              const NavigationRailDestination(
                icon: FaIcon(FontAwesomeIcons.solidUser),
                label: Text("Profile"),
              ),
            ],
            selectedIndex: ref.watch(indexProvider),
          ),
        IndexedStack(
        index: ref.watch(indexProvider),
        children: [AdminHomeScreen(), ProfileScreen()],
      ),
        ],
      ):
      IndexedStack(
        index: ref.watch(indexProvider),
        children: [AdminHomeScreen(), ProfileScreen()],
      ),
    );
  }
}
