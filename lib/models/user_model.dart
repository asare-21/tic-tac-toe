class UserModel {
  String username, uid;
  List<HighScoreModel> highscores;
  UserModel(
      {required this.username, required this.uid, this.highscores = const []});
}

class HighScoreModel {
  double score;
  DateTime date;
  HighScoreModel(this.score, this.date);
}
