import 'package:flutter/material.dart';
import '../screens/practice_screen.dart';
import '../screens/quiz_topic_screen.dart';
import '../screens/terminology_screen.dart';

Widget quickAccessGrid(BuildContext context, {required VoidCallback onGoToLessons}) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: [
        quickCard(Icons.menu_book, "All Lessons", onTap: onGoToLessons),

        quickCard(
          Icons.description,
          "Terminology",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TerminologyScreen()),
            );
          },
        ),

        quickCard(
          Icons.edit,
          "Practice",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PracticeScreen(),
              ),
            );
          },
        ),
        quickCard(
          Icons.quiz,
          "Play Quiz",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuizTopicScreen(),
              ),
            );
          },
        ),

      ],
    ),
  );
}

Widget quickCard(IconData icon, String title, {required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20),
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(128, 128, 128, 0.2),
            blurRadius: 8,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 45, color: Colors.grey),
          const SizedBox(height: 10),
          Text(title, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
