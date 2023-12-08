import 'package:Educonnect/design/my_theme.dart';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:basic_onboarding_app/widget/onboarding_page.dart';

import '../login/login.dart';
import '../login/test.dart';
import 'onboardingPage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _MyOnboardingScreenState();
}

class _MyOnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  late bool _isLastPage;

  final double horizontalPadding = 20;
  final double topPadding = 80;
  final double bottomPadding = 20;
  final double buttonMinHeight = 56;
  final double buttonHorizontalPadding = 32;
  final buttonTextStyle = const TextStyle(fontSize: 18, fontFamily: 'Quantico');

  final String startButtonText = "Commencer";
  final String skipButtonText = "Sauter";
  final String nextButtonText = "Suivant";

  // Define your list of pages. In this example we have 3 pages
  final pages = [
    OnboardingPage(
      color: AppTheme.principalColor,
      svgImage: 'assets/svg/on1.svg',
      Image: '',
      title: '', //'BIENVENUE SUR EDUCONNECT',
      subtitle:
          '', //'Decouvrez comment EduConnect simplifie la gestion de votre classe',
    ),
    OnboardingPage(
      color: AppTheme.principalColor,
      svgImage: 'assets/svg/on2.svg',
      Image: '',
      title: '', //'ENREGISTREMENT',
      subtitle:
          '', //'Enregistrer en un clic les notes et l‘assiduitées de vos élèves',
    ),
    OnboardingPage(
      color: Color.fromARGB(255, 255, 248, 248),
      Image: '',
      svgImage: 'assets/svg/on3.svg',
      title: '', //'Prêt(e)?',
      subtitle:
          '', //'Appuyez sur "commencer" pour decouvrir comment EduConnect peut ameliorer votre enseignement.',
    ),
  ];

  @override
  void initState() {
    _isLastPage = false;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Here include the _onSkip(), _onNext(), _onContinue() code listed in the section buttons

  void _onSkip() => _controller.jumpToPage(pages.length);

  void _onNext() => _controller.nextPage(
      duration: const Duration(milliseconds: 350), curve: Curves.easeIn);

  void _onContinue() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

//ok
  Widget _getPageButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: horizontalPadding,
            bottom: bottomPadding,
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              onPressed: _onSkip,
              child: Text(
                skipButtonText,
                style: buttonTextStyle.copyWith(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: horizontalPadding,
            bottom: bottomPadding,
          ),
          child: Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: buttonMinHeight,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.white,
                    foregroundColor: AppTheme.black,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Ajustez la valeur de votre choix
                    )),
                onPressed: _onNext,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: buttonHorizontalPadding,
                    right: buttonHorizontalPadding,
                  ),
                  child: Text(
                    nextButtonText,
                    style: buttonTextStyle.copyWith(
                      color: const Color.fromRGBO(46, 49, 146, 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getLastPageButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
          bottom: bottomPadding,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                9), // Ajustez le rayon de l'arrondi selon vos préférences
          ),
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              foregroundColor: Colors.white,
              backgroundColor: AppTheme.principalColor,

              ///Changez thirdColor
              minimumSize: Size.fromHeight(buttonMinHeight),
            ),
            onPressed: _onContinue,
            child: Text(
              startButtonText,
              style: buttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                _isLastPage = index == pages.length - 1;
              });
            },
            controller: _controller,
            children: pages,
          ),

          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Align(
              alignment: Alignment.topCenter,
              //Stepper
              child: SmoothPageIndicator(
                controller: _controller,
                count: pages.length,
                effect: SlideEffect(
                    dotColor: Colors.white12,
                    activeDotColor: AppTheme.thirdColor),
                onDotClicked: (index) => _controller.animateToPage(
                  index,
                  duration: const Duration(microseconds: 350),
                  curve: Curves.easeIn,
                ),
              ),
            ),
          ),

          // Here include the _isLastPage listed in the section buttons
          _isLastPage ? _getLastPageButtons() : _getPageButtons()
        ],
      ),
    );
  }
}
