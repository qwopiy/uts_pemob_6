import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uts_pemob_6/widgets/health_bar.dart';

import '../widgets/app_scaffold.dart';
import '../widgets/top_bar.dart';

class QuizScreen extends StatelessWidget{
  final int health = 3;
  final String synopsis;
  final List<String> options;
  const QuizScreen({super.key, required this.synopsis, required this.options});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: TopBar(
        money: 0,
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
              decoration: BoxDecoration(
                color: Colors.white,
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
                        'To the average person, psychic abilities might seem a blessing; for Kusuo Saiki, however, this could not be further from the truth. Gifted with a wide assortment of supernatural abilities ranging from telepathy to x-ray vision, he finds this so-called blessing to be nothing but a curse. As all the inconveniences his powers cause constantly pile up, all Kusuo aims for is an ordinary, hassle-free life—a life where ignorance is bliss. Unfortunately, the life of a psychic is far from quiet. Though Kusuo tries to stay out of the spotlight by keeping his powers a secret from his classmates, he ends up inadvertently attracting the attention of many odd characters, such as the empty-headed Riki Nendou and the delusional Shun Kaidou. Forced to deal with the craziness of the people around him, Kusuo comes to learn that the ordinary life he has been striving for is a lot more difficult to achieve than expected.',
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
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {

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
                              'EP',
                              style: TextStyle(
                                fontFamily: 'Komika',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
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
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {

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
                              'Year',
                              style: TextStyle(
                                fontFamily: 'Komika',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Row(
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
                    ],
                  ),
                ),
                Container (
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.45,
                  height: min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.2,
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
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Answer 1',
                                  style: TextStyle(
                                    fontFamily: 'Komika',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: SizedBox(
                              width: buttonWidth,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Answer 2',
                                  style: TextStyle(
                                    fontFamily: 'Komika',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: SizedBox(
                              width: buttonWidth,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Answer 3',
                                  style: TextStyle(
                                    fontFamily: 'Komika',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: SizedBox(
                              width: buttonWidth,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                child: Text(
                                  'Answer 4',
                                  style: TextStyle(
                                    fontFamily: 'Komika',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
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