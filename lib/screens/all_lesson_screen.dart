import 'package:english_grammer/screens/topic_detail_screen.dart';
import 'package:flutter/material.dart';

class AllLessonsScreen extends StatelessWidget {
  const AllLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2EEE7),
      body: Column(
        children: [
          _header(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Grammar Sections",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Pass context to _sectionCard
                  _sectionCard(
                    context: context,
                    title: "Parts of Speech",
                    items: ["Nouns", "Pronouns", "Verbs", "Adjectives", "Adverbs"],
                  ),

                  SizedBox(height: 20),

                  _sectionCard(
                    context: context,
                    title: "Sentence Structure",
                    items: ["Parts of a Sentence", "Types of Sentences"],
                  ),

                  SizedBox(height: 20),

                  _sectionCard(
                    context: context,
                    title: "Tense",
                    items: ["Present Tense", "Past Tense", "Future Tense"],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔵 Gradient Header
  Widget _header() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16, 40, 16, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff6A11CB),
            Color(0xffFF4E9B),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Lessons",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Explore grammar topics",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // 🟣 Section Card
  _sectionCard({
    required BuildContext context,
    required String title,
    required List<String> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        ...items.map((item) => _lessonItem(context, item, title)).toList(),
      ],
    );
  }



  // 🟢 Single Lesson Row
  _lessonItem(BuildContext context, String title, String section) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TopicDetailScreen(
              topicTitle: title,
              sectionTitle: section,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(14),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text("Start > ", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}

// 🔹 Lesson Detail Page
class LessonDetailScreen extends StatelessWidget {
  final String lessonTitle;

  const LessonDetailScreen({super.key, required this.lessonTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lessonTitle),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "Content for $lessonTitle",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
