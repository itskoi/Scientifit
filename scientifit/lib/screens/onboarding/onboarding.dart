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
          title: "Welcome",
          body:
          "She reached her goal, exhausted. Even more chilling to her was that the euphoria that she thought she'd feel upon reaching it wasn't there. ",
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
          "Maybe such a discussion would result in the determination that meant to be is exactly as meaningless a phrase as it seems to be, and that none of us is actually meant to be doing anything at all.",
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
          "But that's my existential underpants underpinnings showing. It's the way the cookie crumbles. And now I want a cookie.",
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
          "It was something Greg had said he would never wish upon anyone a million times, yet here he was knowingly letting it happen to one of his best friends.",
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
