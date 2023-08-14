import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';

import 'intro_screen.dart';

class SplashScreen extends BaseRoute {
  SplashScreen({a, o}) : super(a: a, o: o, r: 'SplashScreen');
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            children: [
              Container(color: Colors.white, child: Image.asset('assets/images/splash_logo.png')),
              Container(
                margin: const EdgeInsets.only(top: 60),
                child: Text(
                  AppLocalizations.of(context).lbl_loading,
                  style: Theme.of(context).primaryTextTheme.headline6,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroScreen())));
  }
}
