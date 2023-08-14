import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/notification_screen.dart';
import 'package:pet_patner_demo/screens/request_detail_screen.dart';
import 'package:pet_patner_demo/widgets/drawer_widget.dart';
import 'package:pet_patner_demo/models/businessLayer/global.dart' as global;

class RequestListScreen extends BaseRoute {
  RequestListScreen({a, o}) : super(a: a, o: o, r: 'RequestListScreen');
  @override
  _RequestListScreenState createState() => _RequestListScreenState();
}

class _RequestListScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    List<String> username = ['Jenil', 'Denil', 'Ravi'];

    List<String> servicename = ['Hébergement des animaux', "Promenade d'animaux", 'Vétérinaire'];
    List<String> time = ['Il y a 2 heures', 'Il y a 52 heures', 'Il y a 8 heures'];
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of(context).lbl_requests,
        ),
        elevation: 0,
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
      body: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: DefaultTabController(
            length: 5,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,
                  indicatorColor: Theme.of(context).primaryColor,
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: const Color(0xffACB1C0),
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  tabs: [
                    Tab(
                      child: Text(
                        AppLocalizations.of(context).lbl_all,
                      ),
                    ),
                    Tab(
                      child: Text(
                        AppLocalizations.of(context).lbl_hired,
                      ),
                    ),
                    Tab(
                      child: Text(
                        AppLocalizations.of(context).lbl_upcoming,
                      ),
                    ),
                    Tab(
                      child: Text(
                        AppLocalizations.of(context).lbl_in_progress,
                      ),
                    ),
                    Tab(
                      child: Text(
                        AppLocalizations.of(context).lbl_comleted,
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: TabBarView(children: [
                  //first tab cotroller
                  Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RequestDetailScreen()),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(username[index]),
                                    subtitle: Text("Request details..."),
                                    trailing: Text(time[index]),
                                  ),
                                  Container(
                                    margin: global.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.bungalow,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(servicename[index])
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: global.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Il y a 8 heures passées')
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: const Divider(
                                        height: 5,
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 38,
                                        margin: const EdgeInsets.all(10),
                                        width: 100,
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            onPressed: () {
                                              declineDialog();
                                            },
                                            child: Text(
                                                AppLocalizations.of(context)
                                                    .btn_decline,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor))),
                                      ),
                                      Container(
                                          height: 38,
                                          margin: const EdgeInsets.all(10),
                                          width: 100,
                                          child: TextButton(
                                              onPressed: () {
                                                acceptDialog();
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .btn_accept,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ]),
                  //second tab controller
                  Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RequestDetailScreen()),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(username[index]),
                                    subtitle: Text(
                                      "Request details...",
                                    ),
                                    trailing: Text(time[index]),
                                  ),
                                  Container(
                                    margin: global.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.bungalow,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(servicename[index])
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: global.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Past 8 hours ago')
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: const Divider(
                                        height: 5,
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 38,
                                        margin: const EdgeInsets.all(10),
                                        width: 100,
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            onPressed: () {
                                              declineDialog();
                                            },
                                            child: Text(
                                                AppLocalizations.of(context)
                                                    .btn_decline,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor))),
                                      ),
                                      Container(
                                          // color: Colors.red,
                                          height: 38,
                                          margin: const EdgeInsets.all(10),
                                          width: 100,
                                          child: TextButton(
                                              onPressed: () {
                                                acceptDialog();
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .btn_accept,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ]),
                  //third tab controller
                  Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RequestDetailScreen()),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(username[index]),
                                    subtitle: Text("Request details..."),
                                    trailing: Text(time[index]),
                                  ),
                                  Container(
                                    margin: global.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.bungalow,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(servicename[index])
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: global.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Past 8 hours ago')
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: const Divider(
                                        height: 5,
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 38,
                                        margin: const EdgeInsets.all(10),
                                        width: 100,
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            onPressed: () {
                                              declineDialog();
                                            },
                                            child: Text(
                                                AppLocalizations.of(context)
                                                    .btn_decline,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor))),
                                      ),
                                      Container(
                                          height: 38,
                                          margin: const EdgeInsets.all(10),
                                          width: 100,
                                          child: TextButton(
                                              onPressed: () {
                                                acceptDialog();
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .btn_accept,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ]),
                  //forth tab controller
                  Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RequestDetailScreen()),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(username[index]),
                                    subtitle: Text(
                                      "Request details...",
                                    ),
                                    trailing: Text(time[index]),
                                  ),
                                  Container(
                                    margin: global.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.bungalow,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(servicename[index])
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: global.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Past 8 hours ago')
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: const Divider(
                                        height: 5,
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 38,
                                        margin: const EdgeInsets.all(10),
                                        width: 100,
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            onPressed: () {
                                              declineDialog();
                                            },
                                            child: Text(
                                                AppLocalizations.of(context)
                                                    .btn_decline,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor))),
                                      ),
                                      Container(
                                          // color: Colors.red,
                                          height: 38,
                                          margin: const EdgeInsets.all(10),
                                          width: 100,
                                          child: TextButton(
                                              onPressed: () {
                                                acceptDialog();
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .btn_accept,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ]),
                  //fifth tab controller
                  Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext ctx, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RequestDetailScreen()),
                              );
                            },
                            child: Card(
                              margin: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(username[index]),
                                    subtitle: Text(
                                      "Request details...",
                                    ),
                                    trailing: Text(time[index]),
                                  ),
                                  Container(
                                    margin: global.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.bungalow,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(servicename[index])
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: global.isRTL
                                        ? const EdgeInsets.only(right: 10)
                                        : const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.access_time,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Past 8 hours ago')
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: const Divider(
                                        height: 5,
                                      )),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 38,
                                        margin: const EdgeInsets.all(10),
                                        width: 100,
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(
                                                  width: 1.0,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            onPressed: () {
                                              declineDialog();
                                            },
                                            child: Text(
                                                AppLocalizations.of(context)
                                                    .btn_decline,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor))),
                                      ),
                                      Container(
                                          // color: Colors.red,
                                          height: 38,
                                          margin: const EdgeInsets.all(10),
                                          width: 100,
                                          child: TextButton(
                                              onPressed: () {
                                                acceptDialog();
                                              },
                                              child: Text(
                                                AppLocalizations.of(context)
                                                    .btn_accept,
                                              ))),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ]),
                ]))
              ],
            ),

            // TabBarView(children: [Text('data'), Text('data'), Text('data')])
          ),
        ),

        //main scaffold
      ),
    );
  }

  acceptDialog() async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: Text("Requests"),
                content: Text('Are you want to accept request'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      AppLocalizations.of(context).btn_cancel,
                      style: const TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      // Dismiss the dialog but don't
                      // dismiss the swiped item
                      return Navigator.of(context).pop(false);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("confirm"),
                    onPressed: () async {
                      Navigator.pop(context);
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

  declineDialog() async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: Text(
                  "Request",
                ),
                content: Text('Are you want to decline request'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      AppLocalizations.of(context).btn_cancel,
                      style: const TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      // Dismiss the dialog but don't
                      // dismiss the swiped item
                      return Navigator.of(context).pop(false);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('Decline'),
                    onPressed: () async {
                      Navigator.pop(context);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(a: widget.analytics, o: widget.observer)));
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
