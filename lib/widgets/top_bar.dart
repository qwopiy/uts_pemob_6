import 'package:flutter/material.dart';
import 'package:uts_pemob_6/widgets/health_bar.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget{
  final HealthBar? healthBar;
  final int? money;

  const TopBar({
    super.key,
    this.healthBar,
    this.money
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFFFDF6),
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SizedBox(
        height: kToolbarHeight,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (money != null) Text(
                      '${money}',
                      style: const TextStyle(
                        fontFamily: 'Komika',
                        fontSize: 32,
                        fontWeight: FontWeight.w600
                      )
                    ),
                    if (money != null)
                      const Icon(
                        Icons.circle,
                        size: 32,
                        color: Color(0xFFFFC943)
                      ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: healthBar ?? const SizedBox.shrink()
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Image.asset('assets/images/gear_icon.png'),
                onPressed: () {
                  // Handle settings button press
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}