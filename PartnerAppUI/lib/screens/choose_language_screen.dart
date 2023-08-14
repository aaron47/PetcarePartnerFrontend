import 'package:flutter/material.dart';
import 'package:pet_patner_demo/l10n/l10n.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/provider/local_provider.dart';
import 'package:provider/provider.dart';
import 'package:pet_patner_demo/models/businessLayer/global.dart' as global;

class ChooseLanguageScreen extends BaseRoute {
  ChooseLanguageScreen({a, o}) : super(a: a, o: o, r: 'ChooseLanguageScreen');
  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends BaseRouteState {
  int selectedvalue = 2;

  bool isloading = true;
  _ChooseLanguageScreenState() : super();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    var locale = provider.locale ?? Locale('en');
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).lbl_select_language,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: ListView.builder(
                    itemCount: L10n.languageListName.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return RadioListTile(
                        activeColor: Theme.of(context).primaryColor,
                        value: L10n.all[index].languageCode,
                        groupValue: global.languageCode,
                        onChanged: (val) {
                          final provider = Provider.of<LocaleProvider>(context,
                              listen: false);
                          locale = Locale(val);
                          provider.setLocale(locale);
                          global.languageCode = locale.languageCode;
                          if (global.rtlLanguageCodeLList
                              .contains(locale.languageCode)) {
                            global.isRTL = true;
                          } else {
                            global.isRTL = false;
                          }
                          setState(() {});
                        },
                        title: Text(L10n.languageListName[index],
                            style: Theme.of(context).textTheme.subtitle2),
                      );
                    },
                  ),
                )),
          ],
        ));
  }
}
