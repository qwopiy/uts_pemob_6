import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_pemob_6/config/routes.dart';
import 'package:uts_pemob_6/provider/app_state_provider.dart';

void main() {
  runApp(AnimeKuis());
}

class AnimeKuis extends StatelessWidget {
  const AnimeKuis({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Anime Kuis',
    //   debugShowCheckedModeBanner: false,
    //   home: QuizScreen(
    //     synopsis: AppStateProvider.getAnimeSynopsis(0),
    //     options: [
    //       AppStateProvider.getAnimeName(1),
    //       AppStateProvider.getAnimeName(2),
    //       AppStateProvider.getAnimeName(3),
    //       AppStateProvider.getAnimeName(4),
    //     ],
    //   ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppStateProvider(),
        )
      ],
      child: MaterialApp.router(
        title: 'Anime Kuis',
        theme: ThemeData(
          fontFamily: 'Komika',
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
