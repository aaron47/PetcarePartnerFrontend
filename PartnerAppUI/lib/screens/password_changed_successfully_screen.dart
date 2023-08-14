import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordChangesSuccesfullyScreen extends BaseRoute {
  PasswordChangesSuccesfullyScreen({a, o})
      : super(a: a, o: o, r: 'PasswordChangesSuccesfullyScreen');
  @override
  _PasswordChangesSuccesfullyScreenState createState() =>
      _PasswordChangesSuccesfullyScreenState();
}

class _PasswordChangesSuccesfullyScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 400,
            child: Image.asset('assets/images/partnerbaner.jpg'),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      AppLocalizations.of(context).txt_password_reset,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  )
                ],
              )),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      AppLocalizations.of(context).txt_you_are_all_set_to_go,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 190,
          ),
          Container(
              // color: Colors.red,
              height: 45,
              padding: const EdgeInsets.only(left: 15, right: 15),
              margin: const EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(AppLocalizations.of(context).txt_login))),
        ],
      ),
    ));
  }
}
