import 'package:english_grammer/screens/quiz_screen.dart';
import 'package:english_grammer/screens/quiz_topic_screen.dart';
import 'package:english_grammer/screens/topic_detail_screen.dart';
import 'package:flutter/material.dart';
import '../services/progress_service.dart';
import '../widgets/progress_card.dart';
import '../widgets/section_title.dart';
import '../widgets/top_header.dart';
import '../widgets/welcome_card.dart';
import '../widgets/quick_access.dart';
import 'practice_screen.dart';

class HomeScreensBody extends StatefulWidget {
  final VoidCallback onGoToLessons;

  const HomeScreensBody({super.key, required this.onGoToLessons});

  @override
  State<HomeScreensBody> createState() => _HomeScreensBodyState();
}

class _HomeScreensBodyState extends State<HomeScreensBody> {

  String currentLesson = "";
  int quizScore = 0;

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  Future<void> loadProgress() async {
    currentLesson = await ProgressService.getCurrentLesson();
    quizScore = await ProgressService.getQuizScore();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topHeader(),
            welcomeCard(),
            sectionTitle("Your Progress"),

            progressCard(
              lesson: currentLesson,
              score: quizScore,

              // 🔹 Lesson card click
              onLessonTap: () async {
                if (currentLesson == "No lesson completed") return;

                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopicDetailScreen(
                      topicTitle: currentLesson,
                      sectionTitle: "Saved Lesson",
                    ),
                  ),
                );

                loadProgress();
              },

              // 🔹 Score card click
              onScoreTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizTopicScreen(),
                  ),
                );

                loadProgress();
              },
            ),


            sectionTitle("Quick Access"),
            quickAccessGrid(context,
                onGoToLessons: widget.onGoToLessons),
          ],
        ),
      ),
    );
  }
}
