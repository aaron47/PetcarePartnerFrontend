import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';

class ForgotPasswordScreen extends BaseRoute {
  ForgotPasswordScreen({a, o}) : super(a: a, o: o, r: 'ForgotPasswordScreen');
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 350,
                width: 375,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/partnerbaner.jpg'),
                  ),
                ),
              ),
            ]),
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context).txt_reset_password,
                            style: Theme.of(context).primaryTextTheme.headline4,
                          )
                        ],
                      )),
                  Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)
                                      .txt_Enter_the_email_address_associcated_with_your_account,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  Card(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).lbl_email,
                        hintText: AppLocalizations.of(context).hnt_email,
                      ),
                    ),
                  ),
                  Container(
                      height: 45,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      margin: const EdgeInsets.only(bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context).btn_send_reset_link,
                          ))),
                  Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Text(
                              AppLocalizations.of(context).lbl_back,
                              style:
                                  Theme.of(context).primaryTextTheme.bodyText2,
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
