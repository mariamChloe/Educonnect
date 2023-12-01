import 'package:educonnect/design/my_theme.dart';
import 'package:flutter/material.dart';


class OnboardingPage extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final String subtitle;

  

  OnboardingPage({
    required this.color,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    const double verticalSpacing = 20;
    const double horizontalSpacing = 20;

    return Container(
      padding: const EdgeInsets.only(
        left: horizontalSpacing,
        right: horizontalSpacing,
      ),
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,
           height: 300, // ou null
           width: 300,   ),
          //const SizedBox(height: verticalSpacing),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Quantico',
                color: AppTheme.black,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: verticalSpacing),
          Center(
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Quantico',
                color: AppTheme.black,
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}
