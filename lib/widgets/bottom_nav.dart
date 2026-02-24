import 'package:flutter/material.dart';

Widget bottomNav({
  required int selectedIndex,
  required Function(int) onTap,
}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: selectedIndex,
    onTap: onTap,

    // Selected / unselected colors
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,

    showUnselectedLabels: true,
    showSelectedLabels: true,

    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: "Lessons",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.quiz),
        label: "Quiz",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.note),
        label: "Terminology",
      ),
    ],
  );
}
