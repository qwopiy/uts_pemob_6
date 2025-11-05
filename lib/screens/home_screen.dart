import 'package:flutter/material.dart';
import 'package:uts_pemob_6/widgets/app_scaffold.dart';

import '../widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppScaffold(
      appBar: TopBar(
        money: 0,
      ),
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                Container(
                  child:
                      Image.asset(
                      'assets/images/title.png',
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.4,
                      fit: BoxFit.contain,
                    ),
                ),
                SizedBox(
                  height: screenHeight * 0.3,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          fixedSize: WidgetStateProperty.all<Size>(
                            Size(screenWidth * 0.5, screenHeight * 0.09),
                          ),
                        ),
                        onPressed: () {

                        },
                        child: Text(
                          'Play',
                          style: TextStyle(
                            color: const Color(0xFFFFFDF6),
                            fontSize: screenHeight / 25,
                            fontFamily: 'Komika',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          fixedSize: WidgetStateProperty.all<Size>(
                            Size(screenWidth * 0.5, screenHeight * 0.09),
                          ),
                        ),
                        onPressed: () {

                        },
                        child: Text(
                          'Stats',
                          style: TextStyle(
                            color: const Color(0xFFFFFDF6),
                            fontSize: screenHeight / 25,
                            fontFamily: 'Komika',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
      )
    );

  }

}