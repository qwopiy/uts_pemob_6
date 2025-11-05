class User {
  final int id = 0;
  final String name;
  final int correct;
  final int wrong;
  final int coins;
  final int totalCoinsUsed;

  const User({
    required this.name,
    required this.correct,
    required this.wrong,
    required this.coins,
    required this.totalCoinsUsed
  });
}