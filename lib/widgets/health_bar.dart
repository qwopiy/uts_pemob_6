import 'package:flutter/material.dart';

class HealthBar extends StatelessWidget {
  final int health; // 0 sampe 3

  const HealthBar({super.key, required this.health});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.favorite,
          color: (health > 0) ? Colors.red: Colors.black,
          size: kToolbarHeight - 20,
        ),
        Icon(
          Icons.favorite,
          color: (health > 1) ? Colors.red: Colors.black,
          size: kToolbarHeight - 20,
        ),
        Icon(
          Icons.favorite,
          color: (health > 2) ? Colors.red: Colors.black,
          size: kToolbarHeight - 20,
        ),
      ],
    );
  }
}