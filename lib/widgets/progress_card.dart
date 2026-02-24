import 'package:flutter/material.dart';

Widget progressCard({
  required String lesson,
  required int score,
  required VoidCallback onLessonTap,
  required VoidCallback onScoreTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        // 🔹 Current Lesson Card
        Expanded(
          child: GestureDetector(
            onTap: onLessonTap,
            child: Card(
              color: Colors.purple.shade100,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Current Lesson"),
                    const SizedBox(height: 5),
                    Text(
                      lesson,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 10),

        // 🔹 Last Quiz Score Card
        Expanded(
          child: GestureDetector(
            onTap: onScoreTap,
            child: Card(
              color: Colors.green.shade100,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Last Quiz Score"),
                    const SizedBox(height: 5),
                    Text(
                      "$score%",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
