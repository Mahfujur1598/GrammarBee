import 'package:flutter/material.dart';
import 'all_lesson_screen.dart';
import 'home_screens_body.dart';
import 'quiz_topic_screen.dart';
import 'terminology_screen.dart';
import '../widgets/bottom_nav.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    if (index == 2) {
      // Quiz button clicked → push QuizTopicScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const QuizTopicScreen()),
      );
    } else if (index == 3) {
      // Terminology button clicked → push TerminologyScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const TerminologyScreen()),
      );
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreensBody(
        onGoToLessons: () {
          onItemTapped(1); // Lessons page index
        },
      ),
      const AllLessonsScreen(),
      Center(child: Text("Quiz Placeholder")), // Quiz handled by push
      Center(child: Text("Terminology Placeholder")), // Terminology handled by push
    ];

    return Scaffold(
      body: pages[selectedIndex], // Normal tabs: Home & Lessons
      bottomNavigationBar: bottomNav(
        selectedIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
