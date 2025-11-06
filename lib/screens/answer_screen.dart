import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uts_pemob_6/widgets/app_scaffold.dart';

import '../provider/app_state_provider.dart';

class AnswerScreen extends StatelessWidget{
  const AnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppStateProvider>(context, listen: false);
    String imageURL = provider.imageToShow;
    String message = provider.message;

    return AppScaffold(
      body: Center(
        child: Container(
          color: Color(0xFFFFFDF6),
          padding: EdgeInsets.all(20),
          child:
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  imageURL,
                  width: 300,
                  height: 300,
                ),

                SizedBox(height: 20),

                Text(
                  message,
                  style: TextStyle(
                    fontFamily: 'Komika',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      if (provider.health > 0)
                        GoRouter.of(context).go('/quiz');
                      else
                        GoRouter.of(context).go('/result');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(Color(0xFFA0C878)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: 'Komika',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }

}