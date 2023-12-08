import 'package:Educonnect/design/my_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';


class OnboardingPage extends StatelessWidget {
  final Color color;
  final String svgImage;
  
  final String Image;
  final String title;
  final String subtitle;


  

  OnboardingPage({
    required this.color,
    required this.svgImage,
    
    required this.Image,
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
        top: 70,
      ),
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         SvgPicture.asset(
            svgImage,
           height: 400, // ou null
           width: 300,  
            ),
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
