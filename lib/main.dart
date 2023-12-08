import 'package:flutter/material.dart';

import 'view/onbording/onbordingScreen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Replace this with your logic to determine whether to show onboarding or not.
  // For now, I'll use a hardcoded value for demonstration.

  runApp(
    MaterialApp(
      
      //les filles mettez --> import 'view/onbording/onbordingScreen.dart' en commentaire;
      // Remplacez --> onboarding() 
      //par le nom de votre classe si vous voulez tester votre code 
      home: /*showOnboarding ? */OnboardingScreen()/* : HomeScreen()*/,
    ),
  );
}