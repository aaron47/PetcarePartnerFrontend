import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/chat_screen.dart';
import 'package:pet_patner_demo/screens/petowner_detail_screen.dart';
import 'package:pet_patner_demo/models/businessLayer/global.dart' as global;

class RequestDetailScreen extends BaseRoute {
  RequestDetailScreen({a, o}) : super(a: a, o: o, r: 'RequestDetailScreen');
  @override
  _RequestDetailScreenState createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppLocalizations.of(context).lbl_request_detail,
        ),
        actions: [
          Padding(
            padding: global.isRTL
                ? const EdgeInsets.only(left: 15)
                : const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChatScreen(
                          a: widget.analytics,
                          o: widget.observer,
                        )));
              },
              child: const Icon(
                Icons.message_sharp,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/userprofile.jpg'),
                      radius: 90,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Divider(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        height: 38,
                        margin: const EdgeInsets.all(10),
                        width: 100,
                        child: TextButton(
                            onPressed: () {
                              acceptDialog();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => AddIdverificationScreen()),
                              // );
                            },
                            child: Text(
                              AppLocalizations.of(context).btn_accept,
                            ))),
                    Container(
                      height: 38,
                      margin: const EdgeInsets.all(10),
                      width: 100,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1.0,
                                color: Theme.of(context).primaryColor),
                          ),
                          onPressed: () {
                            declineDialog();
                          },
                          child: Text(AppLocalizations.of(context).btn_decline,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor))),
                    ),
                  ],
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'jenil',
                            style: Theme.of(context).primaryTextTheme.headline5,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PetOwnerDetailScreen()),
                                );
                              },
                              child: Text(
                                AppLocalizations.of(context)
                                    .lbl_view_pet_owner_profile,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText2,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.shopping_bag_sharp,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Pet Walking',
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                        )
                      ],
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.calendar_today_rounded,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Dogs Stay overnight,fron thu 23 Sep,1 visit',
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                        )
                      ],
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '9506 South Cotabato, Philippines',
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                        )
                      ],
                    )),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.access_time,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '9:40 PM',
                          style: Theme.of(context).primaryTextTheme.bodyText1,
                        )
                      ],
                    )),
                const Divider(
                  height: 1,
                ),
                Column(
                  children: [
                    ListTile(
                      contentPadding: global.isRTL
                          ? const EdgeInsets.only(left: 10, bottom: 0)
                          : const EdgeInsets.only(right: 10, bottom: 0),
                      title: Padding(
                        padding: global.isRTL
                            ? const EdgeInsets.only(
                                right: 10,
                              )
                            : const EdgeInsets.only(left: 10),
                        child: Text(
                          AppLocalizations.of(context).lbl_pet_profile,
                          style: Theme.of(context).textTheme.subtitle1,
                          // textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Container(
                      padding: global.isRTL
                          ? const EdgeInsets.only(
                              right: 10,
                            )
                          : const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).lbl_pet_name,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'Puppy',
                            style: Theme.of(context).primaryTextTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: global.isRTL
                          ? const EdgeInsets.only(
                              right: 10,
                            )
                          : const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).lbl_pet_type,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'Dog',
                            style: Theme.of(context).primaryTextTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: global.isRTL
                          ? const EdgeInsets.only(
                              right: 10,
                            )
                          : const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context).lbl_pet_size,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            '1-5 Kg',
                            style: Theme.of(context).primaryTextTheme.bodyText1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context).txt_date_service_required,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        '1 Dec. 2021',
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context)
                            .txt_number_of_days_required,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        '1',
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context)
                            .txt_additional_inforamation_you_should_know,
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Text(
                        '10-12-2021',
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 1,
                ),
              ],
            )
          ],
        ),
      )),
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
                      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(a: widget.analytics, o: widget.observer)));
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
