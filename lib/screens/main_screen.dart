import 'package:english_grammer/screens/quiz_topic_screen.dart';
import 'package:english_grammer/screens/terminology_screen.dart';
import 'package:flutter/material.dart';

import 'all_lesson_screen.dart';
import 'home_screens_body.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  // pages list needs to be lazy, so we move HomeScreen to build
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomeScreensBody(
        onGoToLessons: () {
          onItemTapped(1); // Lessons index
        },
      ),
      AllLessonsScreen(),
      QuizTopicScreen(),
      TerminologyScreen()
    ];
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Lessons",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: "Quiz",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Terminology",
          ),
        ],
      ),
    );
  }
}
