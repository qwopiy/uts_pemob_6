import 'package:flutter/material.dart';
import 'package:uts_pemob_6/screens/home_screen.dart';

void main() {
  runApp(const AnimeKuis());
}

class AnimeKuis extends StatelessWidget{
  const AnimeKuis({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Kuis',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}