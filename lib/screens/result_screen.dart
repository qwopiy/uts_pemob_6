import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uts_pemob_6/widgets/app_scaffold.dart';

import '../provider/app_state_provider.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppStateProvider>(context, listen: false);

    return AppScaffold(
      body: Center(
        child: Container(
          color: Color(0xFFFFFDF6),
          padding: EdgeInsets.all(20),
          child:
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Game Over!',
                style: TextStyle(
                  fontFamily: 'Komika',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.black
                ),
              ),
              Text(
                'nice try, ${provider.user.name}!',
                style: TextStyle(
                    fontFamily: 'Komika',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),
              ),
              Text(
                'Your final money: ${provider.user.coins}',
                style: TextStyle(
                    fontFamily: 'Komika',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),
              ),
              Text(
                'right answers: ${provider.user.correct}',
                style: TextStyle(
                    fontFamily: 'Komika',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),
              ),
              Text(
                'wrong answers: ${provider.user.wrong}',
                style: TextStyle(
                    fontFamily: 'Komika',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),
              ),
              Text(
                'total coins used: ${provider.user.totalCoinsUsed}',
                style: TextStyle(
                    fontFamily: 'Komika',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/');
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
                    'Home',
                    style: TextStyle(
                      fontFamily: 'Komika',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
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
                    'Quit App',
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