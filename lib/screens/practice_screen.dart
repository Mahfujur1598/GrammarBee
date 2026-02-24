import 'package:flutter/material.dart';

import '../models/practice_sentence.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  final List<TextEditingController> _controllers = [];
  final List<String?> _feedback = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < practiceSentences.length; i++) {
      _controllers.add(TextEditingController());
      _feedback.add(null);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2EEE7),
      body: Column(
        children: [
          _header(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: practiceSentences.length,
              itemBuilder: (context, index) {
                return _practiceCard(index);
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
            "Practice",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Test yourself with different exercises",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _practiceCard(int index) {
    final sentence = practiceSentences[index];

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fill in the blank with the correct word:"),
          SizedBox(height: 10),
          Row(
            children: [
              Text(sentence.beforeBlank),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _controllers[index],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(sentence.afterBlank),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              String userInput = _controllers[index].text.trim();

              setState(() {
                if (userInput.toLowerCase() ==
                    sentence.answer.toLowerCase()) {
                  _feedback[index] = "correct";
                } else {
                  _feedback[index] =
                  "wrong|${sentence.answer}";
                }
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: Text("CHECK"),
          ),

          SizedBox(height: 10),

          if (_feedback[index] != null)
            _feedback[index]!.startsWith("correct")
                ? Text(
              "✅ Correct!",
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            )
                : Text(
              "❌ Wrong! Correct answer: ${_feedback[index]!.split("|")[1]}",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),


        ],
      ),
    );
  }
}
