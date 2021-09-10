import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to Scientifit!",
          body:
          "We hope you enjoy your stay\nand have a wonderful journey\nwith your diet and fitness!",
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                  child: Image.asset('assets/images/onboarding/2.png'),
                ),
                Image.asset('assets/images/onboarding/1.png')
              ],
            ),
          ),
          decoration: const PageDecoration(
            bodyFlex: 2,
            imageFlex: 3,
            titleTextStyle: TextStyle(
              color: Color(0xFF2B463C),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
            bodyTextStyle: TextStyle(
              color: Color(0xFF688F4E),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w400,
              fontSize: 18.0,
            ),
          ),
        ),
        PageViewModel(
          title: "Track your meals",
          body:
          "Keep tabs on what you ate,\nwhen you ate them, and how much they\naffect your nutritional plan!",
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Image.asset('assets/images/onboarding/3.png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 45, 0, 0),
                  child: Image.asset('assets/images/onboarding/4.png', scale: 2.2,),
                )
              ],
            ),
          ),
          decoration: const PageDecoration(
            bodyFlex: 2,
            imageFlex: 3,
            titleTextStyle: TextStyle(
              color: Color(0xFF2B463C),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
            bodyTextStyle: TextStyle(
              color: Color(0xFF688F4E),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w400,
              fontSize: 18.0,
            ),
          ),
        ),
        PageViewModel(
          title: "Get fit",
          body:
          "Manage your exercise regimen and view how it interacts with your body and diet!",
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Image.asset('assets/images/onboarding/2.png'),
                ),
                Image.asset('assets/images/onboarding/9.png'),
                Image.asset('assets/images/onboarding/5.png',)
              ],
            ),
          ),
          decoration: const PageDecoration(
            bodyFlex: 2,
            imageFlex: 3,
            titleTextStyle: TextStyle(
              color: Color(0xFF2B463C),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
            bodyTextStyle: TextStyle(
              color: Color(0xFF688F4E),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w400,
              fontSize: 18.0,
            ),
          ),
        ),
        PageViewModel(
          title: "Join our community",
          body:
          "Connect with likeminded people\nfor tips and advice\non living a wholesome and healthy life!",
          image: Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
                  child: Image.asset('assets/images/onboarding/7.png',),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Image.asset('assets/images/onboarding/2.png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 90, 0, 0),
                  child: Image.asset('assets/images/onboarding/8.png', scale: 1.5,),
                )
              ],
            ),
          ),
          decoration: const PageDecoration(
            bodyFlex: 2,
            imageFlex: 3,
            titleTextStyle: TextStyle(
              color: Color(0xFF2B463C),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
            bodyTextStyle: TextStyle(
              color: Color(0xFF688F4E),
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w400,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
      onDone: () {
        // When done button is press
        Navigator.pushNamed(context, '/auth');
      },
      onSkip: () {
        // You can also override onSkip callback
        Navigator.pushNamed(context, '/auth');
      },
      showSkipButton: true,
      skip: const Text(
          "Skip",
          style: TextStyle(
            color: Color(0xFF2B463C),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
          )
      ),
      next: const Text(
          "Next",
          style: TextStyle(
            color: Color(0xFF2B463C),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
          )
      ),
      done: const Text(
          "Done",
          style: TextStyle(
            color: Color(0xFF2B463C),
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
          )
      ),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Color(0xFF688F4E),
          color: Color(0xFFDDFFAC),
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
    );
  }
}
