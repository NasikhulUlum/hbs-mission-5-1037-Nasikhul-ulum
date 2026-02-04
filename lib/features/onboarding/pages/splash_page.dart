import 'package:flutter/material.dart';
import 'package:hsb_mission_5/features/onboarding/widgets/logo_center.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/next_button.dart';
import '../widgets/logo_center.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          /// Logo
          LogoCenter(),

          /// Bottom Panel
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 160,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.blackPanel,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Explore the world effortlessly",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),

                  NextButton()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
