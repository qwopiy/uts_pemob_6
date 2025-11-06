import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uts_pemob_6/widgets/app_scaffold.dart';

import '../provider/app_state_provider.dart';

class SettingsScreen extends StatelessWidget{
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: Container(
          color: Color(0xFFFFFDF6),
          padding: EdgeInsets.all(20),
          child:
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/title.png',
                width: 200,
                height: 200,
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