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
        "Passer",
      ),
      next: const Text(
        "Suivant",
      ),
      done: const Text("Fait",
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
        title: "Animaux en bonne santé et heureux",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Center(
              child: Text(
                "La meilleure solution pour les besoins de votre animal, tant pour sa santé mentale que physique.",
                style: Theme.of(context).primaryTextTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            )),
          ],
        ),
        image: Center(child: Image.asset('assets/images/petss.jpg')),
      ),
      PageViewModel(
        title: "Magasin",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Chouchoutez votre animal avec des friandises et des accessoires de notre boutique en ligne.",
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
        title: "Vétérinaire",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Trouvez un vétérinaire fiable que votre animal adorera.",
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
        title: "Mes Animaux",
        bodyWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "Prendre soin des animaux est ma préférence. Cela m'aide à réduire le stress et la fatigue.",
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
                  "Allons-y",
                ))),
        image: Center(child: Image.asset('assets/images/pets1.jpg')),
      ),
    ];
  }
}
