import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uts_pemob_6/widgets/health_bar.dart';

import '../provider/app_state_provider.dart';
import '../widgets/app_scaffold.dart';
import '../widgets/top_bar.dart';

class QuizScreen extends StatefulWidget{
  QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    int health = Provider.of<AppStateProvider>(context).health;
    List<String> options = Provider.of<AppStateProvider>(context).buildOptions();
    String synopsis = AppStateProvider.getAnimeSynopsis(Provider.of<AppStateProvider>(context).currentAnimeIndex);
    String? hint = '';

    return AppScaffold(
      appBar: TopBar(
        money: Provider.of<AppStateProvider>(context).coins,
        healthBar: HealthBar(health: health),
      ),
      body: Wrap(
        direction: Axis.vertical,
        spacing: 20,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: MediaQuery.of(context).size.width * 0.05,
              end: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Container(
              // make background transparent instead of solid white to remove the "blank white box"
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              width: min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.9,
              height: (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.85
                  : MediaQuery.of(context).size.height * 0.45,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(
                        synopsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Komika',
                          fontSize: 24,
                        ),
                      ),
                    ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.directional(
            start: MediaQuery.of(context).size.width * 0.05,
            end: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Row(
              children: [
                SizedBox (
                  width: min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.45,
                  height: min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // center the SKIP button vertically and horizontally
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Provider.of<AppStateProvider>(context, listen: false).skip();
                                hint = Provider.of<AppStateProvider>(context, listen: false).ep;
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                                shape: WidgetStateProperty.all<CircleBorder>(
                                  CircleBorder(),
                                ),
                                fixedSize: WidgetStateProperty.all<Size>(
                                  Size(
                                    min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.2,
                                    min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.1,
                                  ),
                                ),
                              ),
                              child: Text(
                                'SKIP',
                                style: TextStyle(
                                  fontFamily: 'Komika',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 6),
                          // center the coin row as well
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  '2',
                                  style: const TextStyle(
                                      fontFamily: 'Komika',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                              const Icon(
                                  Icons.circle,
                                  size: 16,
                                  color: Color(0xFFFFC943)
                              ),
                            ],
                          )
                        ],
                      ),
                    ]
                  ),
                ),
              ]
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.directional(
              start: MediaQuery.of(context).size.width * 0.05,
              end: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFDDEB9D),
              ),
              width: min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.9,
              height: (MediaQuery.of(context).orientation == Orientation.portrait)
                  ? MediaQuery.of(context).size.width * 0.8
                  : MediaQuery.of(context).size.height * 0.5,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final buttonWidth = min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.8;
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: buttonWidth,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Provider.of<AppStateProvider>(context, listen: false).checkAnswer(0);
                                    GoRouter.of(context).go('/answer');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                      options[0],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Komika',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          SizedBox(height: 10),
                          Expanded(
                            child: SizedBox(
                              width: buttonWidth,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Provider.of<AppStateProvider>(context, listen: false).checkAnswer(1);
                                    GoRouter.of(context).go('/answer');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    options[1],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontFamily: 'Komika',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          SizedBox(height: 10),
                          Expanded(
                            child: SizedBox(
                              width: buttonWidth,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Provider.of<AppStateProvider>(context, listen: false).checkAnswer(2);
                                    GoRouter.of(context).go('/answer');
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    options[2],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: 'Komika',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black
                                      ),
                                    ),
                                  )
                              ),
                            ),
                          SizedBox(height: 10),
                          Expanded(
                            child: SizedBox(
                              width: buttonWidth,
                              child: ElevatedButton(
                                onPressed: () {
                                  Provider.of<AppStateProvider>(context, listen: false).checkAnswer(3);
                                  GoRouter.of(context).go('/answer');
                                },
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  options[3],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Komika',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                    ),
                                  ),
                                )
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                )
            ),
          ),
        ],
      ),
    );
  }
}