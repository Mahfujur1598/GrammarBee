import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../services/progress_service.dart';

class QuizScreen extends StatefulWidget {
  final String selectedTopic;

  const QuizScreen({super.key, required this.selectedTopic});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;

  late List<QuizQuestion> filteredQuestions;

  @override
  void initState() {
    super.initState();
    filteredQuestions = quizQuestions
        .where((q) => q.topic == widget.selectedTopic)
        .toList();
  }

  void checkAnswer(String selectedAnswer) {
    final correctAnswer = filteredQuestions[currentIndex].correctAnswer;

    if (selectedAnswer == correctAnswer) {
      score++;
      _showAnswerDialog(isCorrect: true, correctAnswer: correctAnswer);
    } else {
      _showAnswerDialog(isCorrect: false, correctAnswer: correctAnswer);
    }
  }

  void _showAnswerDialog({
    required bool isCorrect,
    required String correctAnswer,
  }) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(isCorrect ? "Correct ✅" : "Incorrect ❌"),
        content: isCorrect
            ? const Text("Well done!")
            : Text("Correct Answer: $correctAnswer"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _nextQuestion();
            },
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }

  void _nextQuestion() {
    if (currentIndex < filteredQuestions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      _showResult();
    }
  }

  Future<void> _showResult() async {
    int total = filteredQuestions.length;
    int percentage = ((score / total) * 100).round();

    // 🔥 Save quiz score locally
    await ProgressService.saveQuizScore(percentage);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Finished 🎉"),
        content: Text(
          "Your Score: $score / $total\n\nPercentage: $percentage%",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
              Navigator.pop(context, true); // return to home
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (filteredQuestions.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.selectedTopic),
          backgroundColor: Colors.orange,
        ),
        body: const Center(
          child: Text("No questions available for this topic."),
        ),
      );
    }

    final question = filteredQuestions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedTopic),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question ${currentIndex + 1}/${filteredQuestions.length}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),
            Text(
              question.question,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),
            ...question.options.map(
                  (option) => Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () => checkAnswer(option),
                  child: Text(option),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
