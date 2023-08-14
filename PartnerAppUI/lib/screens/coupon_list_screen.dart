import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/Theme/native_theme.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/models/businessLayer/global.dart' as global;
import 'package:pet_patner_demo/screens/add_coupon_screen.dart';

class CouponListScreen extends BaseRoute {
  // CouponListScreen() : super();
  CouponListScreen({a, o}) : super(a: a, o: o, r: 'CouponListScreen');
  @override
  _CouponListScreenState createState() => _CouponListScreenState();
}

class _CouponListScreenState extends BaseRouteState {
  _CouponListScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).lbl_coupons,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext ctx, int index) {
                  return index == 0
                      ? InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => BlogDetailScreen()),
                            // );
                          },
                          child: Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              //  contentPadding: const EdgeInsets.all(0),
                              title: Row(
                                children: [
                                  Padding(
                                    padding: global.isRTL
                                        ? const EdgeInsets.only(right: 5)
                                        : const EdgeInsets.only(
                                            left: 5,
                                          ),
                                    child: Text('20%',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText1),
                                  ),
                                  Text(AppLocalizations.of(context).lbl_off,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1),
                                ],
                              ),
                              subtitle: Padding(
                                padding: global.isRTL
                                    ? const EdgeInsets.only(right: 5)
                                    : const EdgeInsets.only(
                                        left: 5,
                                      ),
                                child: Text(
                                  'Coupon one',
                                ),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    deleteDialog();
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red)),
                            ),
                          ))
                      : InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => BlogDetailScreen()),
                            // );
                          },
                          child: Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              //   contentPadding: const EdgeInsets.all(0),
                              title: Row(
                                children: [
                                  Padding(
                                    padding: global.isRTL
                                        ? const EdgeInsets.only(right: 5)
                                        : const EdgeInsets.only(
                                            left: 5,
                                          ),
                                    child: Text('20%',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .bodyText1),
                                  ),
                                  Text(AppLocalizations.of(context).lbl_off,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .bodyText1),
                                ],
                              ),
                              subtitle: Padding(
                                padding: global.isRTL
                                    ? const EdgeInsets.only(right: 5)
                                    : const EdgeInsets.only(
                                        left: 5,
                                      ),
                                child: Text(
                                  'Test Coupon',
                                ),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    deleteDialog();
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ),
                          ),
                        );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
          // color: Colors.red,
          height: 45,
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          margin: const EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCouponScreen()),
                );
              },
              child: Text(
                AppLocalizations.of(context).btn_add_new_coupon,
              ))),
    );
  }

  deleteDialog() async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: Text("Delete"),
                content: Text('Are your sure to delete this coupon?'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      AppLocalizations.of(context).btn_cancel,
                      style: const TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('Delete'),
                    onPressed: () async {
                      Navigator.of(context).pop();
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
