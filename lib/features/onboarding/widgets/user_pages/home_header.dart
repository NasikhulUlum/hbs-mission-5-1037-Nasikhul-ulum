import 'package:flutter/material.dart';
import 'package:hsb_mission_5/features/onboarding/widgets/logo_center.dart';

class HomeHeader extends StatelessWidget {
  final String userName;

  const HomeHeader({
    super.key,
    required this.userName,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogoCenter(),
        SizedBox(width: 12),
        Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/images/profile_image.png'),
            ),
            SizedBox(width: 19),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hi, $userName!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
                Text('Welcome to Wanderly', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
              ],
            )
          ],
        ),
        SizedBox(width: 12),
      ],
    );
  }
}
