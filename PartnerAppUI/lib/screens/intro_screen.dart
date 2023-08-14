import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';

import 'login_screen.dart';

class IntroScreen extends BaseRoute {
  IntroScreen({a, o}) : super(a: a, o: o, r: 'IntroScreen');
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel(),
      onDone: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      onSkip: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      },
      showSkipButton: true,
      skip: const Text(
        "Skip",
      ),
      next: const Text(
        "Next",
      ),
      done: const Text("Done",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          )),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        activeColor: Theme.of(context).primaryColor,
        color: Colors.black26,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }

  List<PageViewModel> listPagesViewModel() {
    return [
      PageViewModel(
        title: "Health and Happy Pets ",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
              child: Text(
                "The best solution for your pet's need a mental and physical health",
                style: Theme.of(context).primaryTextTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            )),
          ],
        ),
        image: Center(child: Image.asset('assets/images/petss.jpg')),
      ),
      PageViewModel(
        title: "Store",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Spoil your pet with treats and accessories from our online store",
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        image: Center(child: Image.asset('assets/images/pets1.jpg')),
      ),
      PageViewModel(
        title: "Veterinary",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Find reliable veterinary doctor that your  pet will love",
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        image: Center(child: Image.asset('assets/images/pets2.jpg')),
      ),
      PageViewModel(
        title: "My Pets",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Taking care of pets is my favourite.it helps me to gaimr stress and fatigue",
                  style: Theme.of(context).primaryTextTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        footer: Container(
            // color: Colors.red,
            height: 45,
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).size.width,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: const Text(
                  "Let's Go",
                ))),
        image: Center(child: Image.asset('assets/images/pets1.jpg')),
      ),
    ];
  }
}
