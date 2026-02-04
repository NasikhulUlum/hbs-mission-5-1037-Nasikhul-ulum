import 'package:flutter/material.dart';

class LogoCenter extends StatelessWidget {
  const LogoCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return /// Logo Center
      Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            /// Text Image
            Positioned(
              bottom: 45,
              child: Image.asset(
                'assets/images/wanderly_teks.png',
                width: 140,
              ),
            ),

            /// Logo
            Image.asset(
                'assets/images/wanderly.png'
            ),
          ],
        ),
      );
  }
}
