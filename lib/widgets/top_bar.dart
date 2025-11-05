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
                    if (money != null) Text('${money}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    if (money != null) const SizedBox(width: 8),
                    const Icon(Icons.monetization_on, size: 20),
                  ],
                ),
              ),
            ),
            Center(child: healthBar ?? const SizedBox.shrink()),
          ],
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Handle settings button press
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}