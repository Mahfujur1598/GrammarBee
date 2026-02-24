import 'package:shared_preferences/shared_preferences.dart';

class ProgressService {

  static Future<void> saveLesson(String lessonTitle) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentLesson', lessonTitle);
  }

  static Future<void> saveQuizScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('quizScore', score);
  }

  static Future<String> getCurrentLesson() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentLesson') ?? "No lesson completed";
  }

  static Future<int> getQuizScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('quizScore') ?? 0;
  }
}
