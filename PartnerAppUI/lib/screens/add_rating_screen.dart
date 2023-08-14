import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';

class AddRatingScreen extends BaseRoute {
  // AddRatingScreen() : super();
  AddRatingScreen({a, o}) : super(a: a, o: o, r: 'AddRatingScreen');
  @override
  _AddRatingScreenState createState() => _AddRatingScreenState();
}

class _AddRatingScreenState extends BaseRouteState {
  _AddRatingScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).lbl_rate_your_experience),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Text(
                    AppLocalizations.of(context).txt_rate_service_experience,
                    style: Theme.of(context).primaryTextTheme.headline6,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: RatingBar.builder(
                    initialRating: 4,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 30,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: false,
                    updateOnDrag: false,
                    onRatingUpdate: (rating) {},
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Card(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).lbl_comment,
                        hintText: AppLocalizations.of(context)
                            .hnt_write_comments_here,
                      ),
                      maxLines: 6,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
        bottomNavigationBar: Container(
            height: 45,
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppLocalizations.of(context).btn_submit,
                ))));
  }
}
