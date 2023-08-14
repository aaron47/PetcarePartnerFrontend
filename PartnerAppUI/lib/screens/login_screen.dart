import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/forgot_password_screen.dart';
import 'package:pet_patner_demo/screens/otp_verification_screen.dart';
import 'package:pet_patner_demo/screens/signup_screen.dart';

class LoginScreen extends BaseRoute {
  LoginScreen({a, o}) : super(a: a, o: o, r: 'LoginScreen');
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseRouteState {
  bool _showPassword = false;
  var _fPassword = new FocusNode();
  _LoginScreenState() : super();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
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
                    Card(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        autofocus: true,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(_fPassword);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)
                              .lbl_email_or_mobile_no,
                          hintText: AppLocalizations.of(context)
                              .hnt_email_or_mobile_no,
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        focusNode: _fPassword,
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context).lbl_password,
                          hintText: AppLocalizations.of(context).hnt_password,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              setState(() => _showPassword = !_showPassword);
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 45,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OtpVerificationScreen()),
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context).lbl_login,
                            ))),
                    Container(
                        margin: const EdgeInsets.only(top: 0),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: InkWell(
                                child: Text(
                                  AppLocalizations.of(context)
                                      .lbl_forgot_password,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText2,
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ForgotPasswordScreen()),
                                  );
                                },
                              ),
                            )
                          ],
                        )),
                    Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                    AppLocalizations.of(context)
                                        .txt_dont_have_account,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1),
                                InkWell(
                                  child: Text(
                                    AppLocalizations.of(context).lbl_signup,
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText2,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupScreen()),
                                    );
                                  },
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
