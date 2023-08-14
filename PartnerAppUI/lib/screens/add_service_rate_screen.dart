import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/add_pet_photo_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddServiceRateScreen extends BaseRoute {
  AddServiceRateScreen({a, o}) : super(a: a, o: o, r: 'AddServiceRateScreen');
  @override
  _AddServiceRateScreenState createState() => _AddServiceRateScreenState();
}

class _AddServiceRateScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(AppLocalizations.of(context).lbl_add_service_rate),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).lbl_service_type,
                      hintText: AppLocalizations.of(context).hnt_pet_boarding,
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).lbl_your_price,
                      hintText: AppLocalizations.of(context).hnt_inr,
                      //suffix: Text('/night')
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: RichText(
                    text: TextSpan(
                        text: AppLocalizations.of(context)
                            .txt_pet_owners_will_fell_more_comfortable_knowing_waht_is_include_is_this_quote,
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).lbl_description,
                    ),
                    maxLines: 4,
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
                        builder: (context) => AddPetPhotoScreen()),
                  );
                },
                child: Text(
                  AppLocalizations.of(context).btn_save_rate,
                ))));
  }
}
