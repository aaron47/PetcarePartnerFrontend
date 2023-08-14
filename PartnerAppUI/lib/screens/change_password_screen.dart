import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/password_changed_successfully_screen.dart';

class ChangePasswordScreen extends BaseRoute {
  ChangePasswordScreen({a, o}) : super(a: a, o: o, r: 'ChangePasswordScreen');
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends BaseRouteState {
  bool _showPassword1 = false;
  bool _showPassword2 = false;
  bool _showPassword3 = false;
  var _fOpassword = new FocusNode();
  var _fNpassword = new FocusNode();
  var _fCpassword = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).lbl_change_password,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
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
                          AppLocalizations.of(context).txt_create_new_password,
                          style: Theme.of(context).primaryTextTheme.headline5,
                        )
                      ],
                    )),
                Container(
                    //margin: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)
                                    .txt_you_are_just_one_step_away_from_recovering_your_account,
                                style: Theme.of(context).textTheme.bodyText1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 30.0),
                Container(
                  //padding: const EdgeInsets.only(right: 8, left: 8),
                  child: Column(
                    children: [
                      Card(
                        //  margin: const EdgeInsets.all(10),
                        child: TextFormField(
                          autofocus: true,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(_fNpassword);
                          },
                          decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context).lbl_old_password,
                            hintText: AppLocalizations.of(context)
                                .hnt_enter_old_password,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword1
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                setState(
                                    () => _showPassword1 = !_showPassword1);
                              },
                            ),
                          ),
                          obscureText: !_showPassword1,
                        ),
                      ),
                      Card(
                        //margin: const EdgeInsets.all(10),
                        child: TextFormField(
                          focusNode: _fNpassword,
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(_fCpassword);
                          },
                          decoration: InputDecoration(
                            labelText:
                                AppLocalizations.of(context).lbl_new_password,
                            hintText: AppLocalizations.of(context)
                                .hnt_enter_new_password,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword2
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                setState(
                                    () => _showPassword2 = !_showPassword2);
                              },
                            ),
                          ),
                          obscureText: !_showPassword2,
                        ),
                      ),
                      Card(
                        // margin: const EdgeInsets.all(10),
                        child: TextFormField(
                          focusNode: _fCpassword,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)
                                .lbl_confirm_password,
                            hintText: AppLocalizations.of(context)
                                .hnt_enter_confirm_password,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _showPassword3
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                setState(
                                    () => _showPassword3 = !_showPassword3);
                              },
                            ),
                          ),
                          obscureText: !_showPassword3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
            // color: Colors.red,
            height: 45,
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PasswordChangesSuccesfullyScreen()),
                  );
                },
                child: Text(
                  AppLocalizations.of(context).lbl_save,
                ))));
  }
}
