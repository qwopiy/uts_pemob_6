class User {
  final int id;
  final String name;
  final int correct;
  final int wrong;
  final int coins;
  final int totalCoinsUsed;

  const User({
    required this.id,
    required this.name,
    required this.correct,
    required this.wrong,
    required this.coins,
    required this.totalCoinsUsed
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      correct: map['correct'],
      wrong: map['wrong'],
      coins: map['coins'],
      totalCoinsUsed: map['total_coins_used']
    );
  }
}