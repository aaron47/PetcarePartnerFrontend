import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pet_patner_demo/controllers/ApiController.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/about_us_screen.dart';
import 'package:pet_patner_demo/screens/add_rating_screen.dart';
import 'package:pet_patner_demo/screens/change_password_screen.dart';
import 'package:pet_patner_demo/screens/choose_language_screen.dart';
import 'package:pet_patner_demo/screens/help_support_screen.dart';
import 'package:pet_patner_demo/screens/login_screen.dart';
import 'package:pet_patner_demo/screens/update_profile_screen.dart';
import 'package:pet_patner_demo/models/businessLayer/global.dart' as global;

class SettingScreen extends BaseRoute {
  // SettingScreen() : super();
  SettingScreen({a, o}) : super(a: a, o: o, r: 'SettingScreen');
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends BaseRouteState {
  bool isloading = true;

  _SettingScreenState() : super();
  final ApiController apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).lbl_settings,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('assets/images/userprofile.jpg'),
                                //AssetImage(''),

                                //    Image.asset('assets/images/userprofile.jpg'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.all(15),
                            child: Text(apiController.user.value.fullName,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6)),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UpdateProfileScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                    )));
                          },
                          child: Container(
                              color: Colors.transparent,
                              margin:
                                  const EdgeInsets.only(bottom: 10, top: 15),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Icon(
                                          FontAwesomeIcons.user,
                                          color: Theme.of(context).primaryColor,
                                          size: 18,
                                        ),
                                      ),
                                      Padding(
                                        padding: global.isRTL
                                            ? const EdgeInsets.only(right: 15)
                                            : const EdgeInsets.only(left: 15),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .lbl_account,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline6,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(),
                                    child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18,
                                        color: Color(0xFF8F8F8F)),
                                  ),
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChooseLanguageScreen(
                                      a: widget.analytics,
                                      o: widget.observer,
                                    )));
                          },
                          child: Container(
                              color: Colors.transparent,
                              margin:
                                  const EdgeInsets.only(bottom: 10, top: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Row(
                                  //   children: [
                                  //     Padding(
                                  //       padding: const EdgeInsets.only(),
                                  //       child: Icon(
                                  //         FontAwesomeIcons.language,
                                  //         color: Theme.of(context).primaryColor,
                                  //         size: 18,
                                  //       ),
                                  //     ),
                                  //     Padding(
                                  //       padding: global.isRTL
                                  //           ? const EdgeInsets.only(right: 15)
                                  //           : const EdgeInsets.only(left: 15),
                                  //       child: Text(
                                  //         AppLocalizations.of(context)
                                  //             .lbl_language_selection,
                                  //         style: Theme.of(context)
                                  //             .primaryTextTheme
                                  //             .headline6,
                                  //       ),
                                  //     )
                                  //   ],
                                  // ),
                                  // const Padding(
                                  //   padding: EdgeInsets.only(),
                                  //   child: Icon(
                                  //       Icons.arrow_forward_ios_outlined,
                                  //       size: 18,
                                  //       color: Color(0xFF8F8F8F)),
                                  // )
                                ],
                              )),
                        ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => ChangePasswordScreen(
                        //               a: widget.analytics,
                        //               o: widget.observer,
                        //             )));
                        //   },
                        //   child: Container(
                        //       color: Colors.transparent,
                        //       margin:
                        //           const EdgeInsets.only(bottom: 10, top: 10),
                        //       width: MediaQuery.of(context).size.width,
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Padding(
                        //                 padding: const EdgeInsets.only(),
                        //                 child: Icon(
                        //                   FontAwesomeIcons.key,
                        //                   color: Theme.of(context).primaryColor,
                        //                   size: 18,
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: global.isRTL
                        //                     ? const EdgeInsets.only(right: 15)
                        //                     : const EdgeInsets.only(left: 15),
                        //                 child: Text(
                        //                   AppLocalizations.of(context)
                        //                       .lbl_change_password,
                        //                   style: Theme.of(context)
                        //                       .primaryTextTheme
                        //                       .headline6,
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //           const Padding(
                        //             padding: EdgeInsets.only(),
                        //             child: Icon(
                        //                 Icons.arrow_forward_ios_outlined,
                        //                 size: 18,
                        //                 color: Color(0xFF8F8F8F)),
                        //           )
                        //         ],
                        //       )),
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => HelpAndSupportScreen(
                        //               a: widget.analytics,
                        //               o: widget.observer,
                        //             )));
                        //   },
                        //   child: Container(
                        //       color: Colors.transparent,
                        //       margin:
                        //           const EdgeInsets.only(bottom: 10, top: 10),
                        //       width: MediaQuery.of(context).size.width,
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Padding(
                        //                 padding: const EdgeInsets.only(),
                        //                 child: Icon(
                        //                   Icons.help,
                        //                   color: Theme.of(context).primaryColor,
                        //                   size: 18,
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: global.isRTL
                        //                     ? const EdgeInsets.only(right: 15)
                        //                     : const EdgeInsets.only(left: 15),
                        //                 child: Text(
                        //                   AppLocalizations.of(context)
                        //                       .lbl_help_supports,
                        //                   style: Theme.of(context)
                        //                       .primaryTextTheme
                        //                       .headline6,
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //           const Padding(
                        //             padding: EdgeInsets.only(),
                        //             child: Icon(
                        //                 Icons.arrow_forward_ios_outlined,
                        //                 size: 18,
                        //                 color: Color(0xFF8F8F8F)),
                        //           )
                        //         ],
                        //       )),
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => AboutUsScreen(
                        //               a: widget.analytics,
                        //               o: widget.observer,
                        //             )));
                        //   },
                        //   child: Container(
                        //       color: Colors.transparent,
                        //       margin:
                        //           const EdgeInsets.only(bottom: 10, top: 10),
                        //       width: MediaQuery.of(context).size.width,
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Padding(
                        //                 padding: const EdgeInsets.only(),
                        //                 child: Icon(
                        //                   FontAwesomeIcons.infoCircle,
                        //                   color: Theme.of(context).primaryColor,
                        //                   size: 18,
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: global.isRTL
                        //                     ? const EdgeInsets.only(right: 15)
                        //                     : const EdgeInsets.only(left: 15),
                        //                 child: Text(
                        //                   AppLocalizations.of(context)
                        //                       .lbl_about_us,
                        //                   style: Theme.of(context)
                        //                       .primaryTextTheme
                        //                       .headline6,
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //           const Padding(
                        //             padding: EdgeInsets.only(),
                        //             child: Icon(
                        //                 Icons.arrow_forward_ios_outlined,
                        //                 size: 18,
                        //                 color: Color(0xFF8F8F8F)),
                        //           )
                        //         ],
                        //       )),
                        // ),
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => AddRatingScreen(
                        //               a: widget.analytics,
                        //               o: widget.observer,
                        //             )));
                        //   },
                        //   child: Container(
                        //       color: Colors.transparent,
                        //       margin:
                        //           const EdgeInsets.only(bottom: 10, top: 10),
                        //       width: MediaQuery.of(context).size.width,
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Padding(
                        //                 padding: const EdgeInsets.only(),
                        //                 child: Icon(
                        //                   FontAwesomeIcons.thumbsUp,
                        //                   color: Theme.of(context).primaryColor,
                        //                   size: 18,
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding: global.isRTL
                        //                     ? const EdgeInsets.only(right: 15)
                        //                     : const EdgeInsets.only(left: 15),
                        //                 child: Text(
                        //                   AppLocalizations.of(context)
                        //                       .lbl_rate_us,
                        //                   style: Theme.of(context)
                        //                       .primaryTextTheme
                        //                       .headline6,
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //           const Padding(
                        //             padding: EdgeInsets.only(),
                        //             child: Icon(
                        //                 Icons.arrow_forward_ios_outlined,
                        //                 size: 18,
                        //                 color: Color(0xFF8F8F8F)),
                        //           )
                        //         ],
                        //       )),
                        // ),
                        GestureDetector(
                          onTap: () {
                            logOutDialog();
                          },
                          child: Container(
                              color: Colors.transparent,
                              margin:
                                  const EdgeInsets.only(bottom: 10, top: 35),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(),
                                        child: Icon(
                                          FontAwesomeIcons.signOutAlt,
                                          color: Theme.of(context).primaryColor,
                                          size: 18,
                                        ),
                                      ),
                                      Padding(
                                        padding: global.isRTL
                                            ? const EdgeInsets.only(right: 15)
                                            : const EdgeInsets.only(left: 15),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .lbl_logout,
                                          style: Theme.of(context)
                                              .primaryTextTheme
                                              .headline6,
                                        ),
                                      )
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(),
                                    child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 18,
                                        color: Color(0xFF8F8F8F)),
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ]))));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  logOutDialog() async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: Text(
                  "Exit",
                ),
                content: Text('Are you sure you want to exit app?'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      'Cancle',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      // Dismiss the dialog but don't
                      // dismiss the swiped item
                      return Navigator.of(context).pop(false);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('Logout'),
                    onPressed: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen(
                              a: widget.analytics, o: widget.observer)));
                    },
                  ),
                ],
              ),
            );
          });
    } catch (e) {
      print('Exception - base.dart - exitAppDialog(): ' + e.toString());
    }
  }
}
