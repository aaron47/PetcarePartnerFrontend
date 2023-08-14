import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/coupon_list_screen.dart';
import 'package:pet_patner_demo/screens/gallery_list_screen.dart';
import 'package:pet_patner_demo/screens/login_screen.dart';
import 'package:pet_patner_demo/screens/my_wallet_screen.dart';
import 'package:pet_patner_demo/screens/orderlist_screen.dart';
import 'package:pet_patner_demo/screens/productlist_screen.dart';
import 'package:pet_patner_demo/screens/setting_Screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends BaseRoute {
  DrawerWidget({a, o}) : super(a: a, o: o, r: 'DrawerWidget');
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          //color: Theme.of(context).primaryColor,
          color: const Color(0xff3646C3),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 08),
                child: ListTile(
                    leading: const CircleAvatar(
                        radius: 25,
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                            'assets/images/userprofile.jpg',
                          ),
                        )),
                    title: Text(
                      'Jenil Patel',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    subtitle: Text(
                      '9525098250',
                      style: Theme.of(context).textTheme.headline6,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.wallet,
                    color: Colors.white,
                    size: 22,
                  ),
                  title: Text(
                    AppLocalizations.of(context).lbl_my_wallet,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MyWalletScreen()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.tag,
                    color: Colors.white,
                    size: 22,
                  ),
                  title: Text(
                    AppLocalizations.of(context).lbl_coupons,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => CouponListScreen()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: const Icon(
                    Icons.image_sharp,
                    color: Colors.white,
                    size: 22,
                  ),
                  title: Text(
                    AppLocalizations.of(context).lbl_gallery,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => GalleryListScreen()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: const Icon(
                    Icons.card_giftcard,
                    color: Colors.white,
                    size: 22,
                  ),
                  title: Text(
                    AppLocalizations.of(context).lbl_add_products,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ProductListScreen()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: const Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                    size: 22,
                  ),
                  title: Text(
                    AppLocalizations.of(context).lbl_orders,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => OrderListScreen()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.cog,
                    color: Colors.white,
                    size: 22,
                  ),
                  title: Text(
                    AppLocalizations.of(context).lbl_settings,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SettingScreen()));
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 0),
              //   child: ListTile(
              //     leading: Icon(
              //       FontAwesomeIcons.key,
              //       color: Colors.white,
              //       size: 22,
              //     ),
              //     title: Text(
              //       'Change Password',
              //       style: Theme.of(context).textTheme.headline6,
              //     ),
              //     onTap: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //             builder: (context) => ChangePasswordScreen()),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(),
              //   child: ListTile(
              //     leading: Icon(
              //       FontAwesomeIcons.language,
              //       color: Colors.white,
              //       size: 22,
              //     ),
              //     title: Text(
              //       'Select Language',
              //       style: Theme.of(context).textTheme.headline6,
              //     ),
              //     onTap: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //             builder: (context) => ChooseLanguageScreen()),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(),
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.help,
              //       color: Colors.white,
              //       size: 22,
              //     ),
              //     title: Text(
              //       'Help and Support',
              //       style: Theme.of(context).textTheme.headline6,
              //     ),
              //     onTap: () {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //             builder: (context) => HelpAndSupportScreen(
              //                   a: widget.analytics,
              //                   o: widget.observer,
              //                 )),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  leading: const Icon(FontAwesomeIcons.signOutAlt,
                      color: Colors.white, size: 22),
                  title: Text(
                    AppLocalizations.of(context).lbl_signout,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  onTap: () {
                    logOutDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
                  AppLocalizations.of(context).lbl_exit,
                ),
                content: Text(AppLocalizations.of(context)
                    .txt_are_you_sure_you_want_to_exit_app),
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
                    child: Text(AppLocalizations.of(context).btn_logout),
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
