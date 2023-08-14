import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/login_screen.dart';
import 'package:pet_patner_demo/widgets/bottomnavigationbar.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OtpVerificationScreen extends BaseRoute {
  OtpVerificationScreen({a, o}) : super(a: a, o: o, r: 'OtpVerificationScreen');
  @override
  _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends BaseRouteState {
  final TextEditingController _pinPutController = TextEditingController();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          title: Text(
            AppLocalizations.of(context).lbl_otp_verification,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).lbl_enter_otp,
                        style: Theme.of(context).textTheme.headline4,
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
                                  .txt_we_have_sent_the_login_otp_on_your_mobile_number,
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                // color: Colors.red,
                width: 250,
                padding: const EdgeInsets.only(top: 30),
                child: PinPut(
                  textStyle: const TextStyle(color: Colors.black),
                  inputDecoration: InputDecoration(
                      counterStyle:
                          Theme.of(context).primaryTextTheme.headline6,
                      fillColor: Colors.transparent,
                      border: InputBorder.none,
                      counterText: '',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                  autofocus: false,
                  fieldsCount: 4,
                  controller: _pinPutController,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    border: Border.all(
                        width: 0, color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  selectedFieldDecoration: _pinPutDecoration,
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                  // color: Colors.red,
                  height: 45,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Bottomnavigationbar()),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context).txt_login,
                      )))
            ],
          ),
        ));
  }
}
