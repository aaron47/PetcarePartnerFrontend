import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/blog_list_screen.dart';
import 'package:pet_patner_demo/screens/home_screen.dart';
import 'package:pet_patner_demo/screens/offer_service_screen.dart';
import 'package:pet_patner_demo/screens/profile_screen.dart';
import 'package:pet_patner_demo/screens/request_list_screen.dart';

import 'drawer_widget.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Bottomnavigationbar extends BaseRoute {
  Bottomnavigationbar({a, o}) : super(a: a, o: o, r: 'Bottomnavigationbar');
  @override
  _BottomnavigationbarState createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends BaseRouteState {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        return null;
      },
      child: SafeArea(
        child: Scaffold(
            bottomNavigationBar: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: BottomNavigationBar(
                fixedColor: Theme.of(context).primaryColor,
                onTap: _onItemTap,
                currentIndex: _selectedIndex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.home,
                    ),
                    label: AppLocalizations.of(context).lbl_home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.message_outlined,
                    ),
                    label: AppLocalizations.of(context).lbl_request,
                  ),
                  BottomNavigationBarItem(
                    icon: const FaIcon(
                      FontAwesomeIcons.blog,
                    ),
                    label: AppLocalizations.of(context).lbl_blogs,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.menu_book_sharp,
                    ),
                    label: AppLocalizations.of(context).lbl_services,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.person,
                    ),
                    label: AppLocalizations.of(context).lbl_profile,
                  )
                ],
              ),
            ),
            drawer: _selectedIndex == 0 ? DrawerWidget() : null,
            body: _children().elementAt(_selectedIndex)),
      ),
    );
  }

  bool isloading = true;

  _onItemTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  List<Widget> _children() => [HomeScreen(), RequestListScreen(), BlogListScreen(), OfferServiceScreen(), ProfileScreen()];
}
