import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class QuizTopicScreen extends StatelessWidget {
  const QuizTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> topics = [
      "Tense",
      "Parts of Speech",
      "Voice",
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF2EEE7),
      body: Column(
        children: [
          _header(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return _topicCard(context, title: topics[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 25),
      decoration: const BoxDecoration(
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Grammar Topic",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Choose a topic to start your quiz",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _topicCard(BuildContext context, {required String title}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => QuizScreen(selectedTopic: title),
            ),
          );
        },
      ),
    );
  }
}
