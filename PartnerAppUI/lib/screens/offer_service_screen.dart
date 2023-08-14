import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/notification_screen.dart';
import 'package:pet_patner_demo/screens/service_agreement_screen.dart';
import 'package:pet_patner_demo/widgets/drawer_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OfferServiceScreen extends BaseRoute {
  OfferServiceScreen({a, o}) : super(a: a, o: o, r: 'OfferServiceScreen');
  @override
  _OfferServiceScreenState createState() => _OfferServiceScreenState();
}

class _OfferServiceScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).lbl_services,
        ),
        automaticallyImplyLeading: false,
        actions: [
          Container(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.bell),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()),
                    );
                  }))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          //center button
          Center(
            child: Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/splash_logo.png',
                      ),
                    ),
                  ),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            width: 1.0, color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceAgreementScreen()),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context).btn_offer_services_now,
                        style: Theme.of(context).primaryTextTheme.bodyText2,
                      ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
