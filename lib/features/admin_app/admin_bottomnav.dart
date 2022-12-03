import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quizz_app/utils/app_colors.dart';
import 'package:quizz_app/features/quiz_app/user_profile/views/profile_screen.dart';

import 'add_delete_quiz/views/add_quiz._screen.dart';
import 'count_users_quizes/views/admin_home.dart';

var indexProvider = StateProvider((ref) => 0);

class AdminBotnavbar extends ConsumerStatefulWidget {
  const AdminBotnavbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminBotnavbarState();
}

class _AdminBotnavbarState extends ConsumerState<AdminBotnavbar>
    with TickerProviderStateMixin {
  late AnimationController _onpagedisplaycontroller;

  @override
  void initState() {
    super.initState();

    _onpagedisplaycontroller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _onpagedisplaycontroller.dispose();
    super.dispose();
  }

  bool _isPageClosed() {
    return _onpagedisplaycontroller.value == 0.0;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              currentIndex: ref.watch(indexProvider),
              onTap: (index) {
                ref.read(indexProvider.state).state = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: FaIcon(FontAwesomeIcons.house),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: FaIcon(FontAwesomeIcons.solidUser),
                  ),
                  label: "Profile",
                ),
              ],
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: MediaQuery.of(context).size.width < 640
          ? FloatingActionButton(
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
            )
          : null,
      body: (MediaQuery.of(context).size.width >= 640)
          ? Row(
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
                                return AnimatedBuilder(
                                  animation: _onpagedisplaycontroller,
                                  builder: (context, child) {
                                    return FractionalTranslation(
                                      translation: Offset(
                                          1.0 - _onpagedisplaycontroller.value,
                                          0.0),
                                      child: _isPageClosed()
                                          ? const SizedBox()
                                          : const AddQuizz(),
                                    );
                                  },
                                );
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
                IndexedStack(index: ref.watch(indexProvider), children: [
                  //AdminHomeScreen(),

                  Scaffold(
                    appBar: AppBar(
                      title: Text(
                        'Admin Panel',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  Container(
                    color: AppColors.blue,
                  )
                ] //ProfileScreen(),
                    ),
              ],
            )
          : IndexedStack(
              index: ref.watch(indexProvider),
              children: [AdminHomeScreen(), ProfileScreen()],
            ),
    );
  }
}
