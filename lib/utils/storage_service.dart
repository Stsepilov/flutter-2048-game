import 'package:shared_preferences/shared_preferences.dart';

Future<int> loadScore() async {
  final prefs = await SharedPreferences.getInstance();
  var score = prefs.getInt('score') ?? 0;
  return score;
}

Future<void> saveScore(int score) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('score', score);
}

Future<bool> clearScore() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove('score');
}