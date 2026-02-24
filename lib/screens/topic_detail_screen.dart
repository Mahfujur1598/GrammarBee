import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:english_grammer/services/progress_service.dart'; // তোমার ProgressService

class TopicDetailScreen extends StatefulWidget {
  final String topicTitle;
  final String sectionTitle;

  const TopicDetailScreen({
    super.key,
    required this.topicTitle,
    required this.sectionTitle,
  });

  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  final Map<String, Map<String, String>> lessonContent = {

    "Nouns": {
      "title": "What is a Noun?",
      "definition":
      "A noun is the name of a person, place, thing, or idea. It can be something you can see (book, car) or something you cannot see (love, honesty).",
      "hasan":
      "Rahim is a boy.\nDhaka is a city.\nHappiness is important.\nThe cat is sleeping on the chair."
    },

    "Pronouns": {
      "title": "What is a Pronoun?",
      "definition":
      "A pronoun is a word that replaces a noun in a sentence to avoid repetition. Common pronouns are he, she, it, they, we, I, you.",
      "hasan":
      "Rahim is a boy. He is very kind.\nSara has a book. She reads it every day."
    },

    "Verbs": {
      "title": "What is a Verb?",
      "definition":
      "A verb is a word that shows action or state of being. It tells what the subject does or what happens.",
      "hasan":
      "She runs fast.\nThey are happy.\nThe baby is crying."
    },

    "Adjectives": {
      "title": "What is an Adjective?",
      "definition":
      "An adjective describes or modifies a noun. It tells us more about a person, place, or thing.",
      "hasan":
      "She has a beautiful dress.\nIt is a big house.\nHe is a smart student."
    },

    "Adverbs": {
      "title": "What is an Adverb?",
      "definition":
      "An adverb modifies a verb, adjective, or another adverb. It often tells how, when, where, or how much.",
      "hasan":
      "He runs quickly.\nShe sings very beautifully.\nThey arrived early."
    },

    "Parts of a Sentence": {
      "title": "Parts of a Sentence",
      "definition":
      "A sentence has two main parts: Subject and Predicate. The subject tells who or what the sentence is about. The predicate tells what the subject does.",
      "hasan":
      "Rahim plays football.\n(Rahim = Subject, plays football = Predicate)\nThe dog barked loudly."
    },

    "Types of Sentences": {
      "title": "Types of Sentences",
      "definition":
      "There are four types of sentences: Declarative (statement), Interrogative (question), Imperative (command), and Exclamatory (strong feeling).",
      "hasan":
      "I am happy.\nAre you coming?\nClose the door.\nWhat a beautiful day!"
    },

    "Present Tense": {
      "title": "What is Present Tense?",
      "definition":
      "Present tense describes actions happening now, regularly, or facts that are always true.",
      "hasan":
      "She goes to school every day.\nThe sun rises in the east.\nI am reading a book."
    },

    "Past Tense": {
      "title": "What is Past Tense?",
      "definition": "Past tense describes actions that already happened in the past.",
      "hasan":
      "She went to school yesterday.\nThey played football last evening.\nI finished my homework."
    },

    "Future Tense": {
      "title": "What is Future Tense?",
      "definition": "Future tense describes actions that will happen later.",
      "hasan":
      "She will go to school tomorrow.\nWe will visit Cox's Bazar next month.\nI will call you tonight."
    },
  };

  @override
  void initState() {
    super.initState();
    _saveCurrentLesson(); // ইউজার যে লেসন দেখছে সেটা সেভ কর
  }

  // 🔹 Current Lesson SharedPreferences-এ সেভ
  void _saveCurrentLesson() async {
    await ProgressService.saveLesson(widget.topicTitle);
  }

  @override
  Widget build(BuildContext context) {
    final content = lessonContent[widget.topicTitle];

    return Scaffold(
      backgroundColor: const Color(0xffEDE7DC),
      body: Column(
        children: [
          _header(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: content == null
                  ? const Text("No content available")
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _definitionCard(content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff4A7BD0), Color(0xffF25C54)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          const SizedBox(height: 15),
          Text(
            widget.topicTitle,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            widget.sectionTitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _definitionCard(Map<String, String> content) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content["title"]!,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content["definition"]!,
            style: const TextStyle(
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffD6E4F0),
              borderRadius: BorderRadius.circular(15),
              border: const Border(
                left: BorderSide(
                  color: Color(0xff4A7BD0),
                  width: 5,
                ),
              ),
            ),
            child: Text(
              "Example:\n${content["hasan"]!}",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
