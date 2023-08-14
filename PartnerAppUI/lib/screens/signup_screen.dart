import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/service_selection_screen.dart';

import 'login_screen.dart';

class SignupScreen extends BaseRoute {
  SignupScreen({a, o}) : super(a: a, o: o, r: 'SignupScreen');
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends BaseRouteState {
  bool _showPassword = false;
  var _femail = new FocusNode();
  var _fPassword = new FocusNode();
  var _fUsername = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Stack(children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/partnerbaner.jpg'),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    child: Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                      ),
                    ),
                  )
                ]),
              ),
              Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    Card(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        autofocus: true,
                        onEditingComplete: () {
                          FocusScope.of(context).requestFocus(_femail);
                        },
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)
                              .lbl_email_or_mobile_no,
                          hintText: AppLocalizations.of(context)
                              .hnt_email_or_mobile_no,
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          focusNode: _femail,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(_fUsername);
                          },
                          decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context).lbl_enter_email,
                            hintText:
                                AppLocalizations.of(context).hnt_enter_eamil,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          focusNode: _fUsername,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(_fPassword);
                          },
                          decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context).lbl_username,
                            hintText: AppLocalizations.of(context).hnt_username,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        focusNode: _fPassword,
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
                        obscureText: !_showPassword,
                      ),
                    ),
                    // Container(
                    //   child: Container(
                    //     height: 150,
                    //     child: ListView(
                    //       children: numbers.keys.map((String key) {
                    //         return new CheckboxListTile(
                    //           title: new Text(
                    //             key,
                    //             style: TextStyle(color: Colors.black),
                    //           ),
                    //           value: numbers[key],
                    //           activeColor: Theme.of(context).primaryColor,
                    //           checkColor: Colors.white,
                    //           onChanged: (bool value) {
                    //             setState(() {
                    //               numbers[key] = value;
                    //             });
                    //           },
                    //         );
                    //       }).toList(),
                    //     ),
                    //   ),
                    // ),
                    Container(
                        // color: Colors.red,
                        height: 45,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ServiceSelectionScreen()),
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context).btn_next,
                            ))),
                    Container(
                        margin: const EdgeInsets.all(30),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)
                                      .txt_already_have_account,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .bodyText1,
                                ),
                                InkWell(
                                  child: Text(
                                      AppLocalizations.of(context).txt_login,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText2),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
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
