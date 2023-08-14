import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';

class MyWalletScreen extends BaseRoute {
  MyWalletScreen({a, o}) : super(a: a, o: o, r: 'MyWalletScreen');
  @override
  _MyWalletScreenState createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends BaseRouteState {
  _MyWalletScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).lbl_my_wallet,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                // margin: const EdgeInsets.all(5),
                child: Card(
                  color: const Color(0xffdddff5),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context).txt_total_earning,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).primaryTextTheme.headline6,
                          ),
                          Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  FaIcon(
                                    FontAwesomeIcons.rupeeSign,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3),
                                    child: Text('500'),
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.custom(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  childrenDelegate: SliverChildListDelegate(
                    [
                      Container(
                        //margin: const EdgeInsets.all(5),
                        child: Card(
                          color: const Color(0xffdddff5),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .txt_admin_share_spent_by_admin,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline6,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          FaIcon(
                                            FontAwesomeIcons.rupeeSign,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text('200'),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // margin: const EdgeInsets.all(5),
                        child: Card(
                          color: const Color(0xffdddff5),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .txt_admin_share_pending_at_vendor,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline6,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          FaIcon(
                                            FontAwesomeIcons.rupeeSign,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text('500'),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        //margin: const EdgeInsets.all(5),
                        child: Card(
                          color: const Color(0xffdddff5),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .txt_admin_share_pending_at_vendor,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline6,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          FaIcon(
                                            FontAwesomeIcons.rupeeSign,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text('500'),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        //margin: const EdgeInsets.all(5),
                        child: Card(
                          color: const Color(0xffdddff5),
                          child: Center(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .txt_total_vendor_share_pending_at_admin,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .headline6,
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          FaIcon(
                                            FontAwesomeIcons.rupeeSign,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text('500'),
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
