import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/services_list_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceAgreementScreen extends BaseRoute {
  ServiceAgreementScreen({a, o})
      : super(a: a, o: o, r: 'ServiceAgreementScreen');
  @override
  _ServiceAgreementScreenState createState() => _ServiceAgreementScreenState();
}

class _ServiceAgreementScreenState extends BaseRouteState {
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).lbl_agreement),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              Column(children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    AppLocalizations.of(context).txt_terms_and_condition,
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'App terms and conditions are an important legal document for app developers and owners, as they establish the rules and restrictions for app use. Terms and conditions for mobile apps help protect your intellectual property, prevent misuse of your app, and limit legal disputes.',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'App terms and conditions are an important legal document for app developers and owners, as they establish the rules and restrictions for app use. Terms and conditions for mobile apps help protect your intellectual property, prevent misuse of your app, and limit legal disputes.',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'App terms and conditions are an important legal document for app developers and owners, as they establish the rules and restrictions for app use. Terms and conditions for mobile apps help protect your intellectual property, prevent misuse of your app, and limit legal disputes.',
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    agree = !agree;
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        value: agree,
                        onChanged: (value) {
                          setState(() {
                            agree = value;
                          });
                        },
                      ),
                      Text(
                        AppLocalizations.of(context)
                            .txt_i_have_read_and_accept_terms_and_conditions,
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: agree
            ? Container(
                // color: Colors.red,
                height: 45,
                padding: const EdgeInsets.only(left: 15, right: 15),
                margin: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                    onPressed: agree ? _doSomething : null,
                    child: Text(
                      AppLocalizations.of(context).btn_next,
                    )))
            : const SizedBox(),
      ),
    );
  }

  void _doSomething() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ServiceListScreen()),
    );
  }
}
