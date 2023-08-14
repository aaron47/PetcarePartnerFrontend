import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PetOwnerDetailScreen extends BaseRoute {
  PetOwnerDetailScreen({a, o}) : super(a: a, o: o, r: 'PetOwnerDetailScreen');
  @override
  _PetOwnerDetailScreenState createState() => _PetOwnerDetailScreenState();
}

class _PetOwnerDetailScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).lbl_profile),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/userprofile.jpg'),
                  radius: 40,
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(
                      left: 1,
                    ),
                    title: Text('Jenil',
                        style: Theme.of(context).primaryTextTheme.bodyText1),
                    subtitle: Text('Lives in India'),
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      height: 40,
                      margin: const EdgeInsets.all(0),
                      width: 100,
                      child: TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => AddIdverificationScreen()),
                            // );
                          },
                          child: Text(
                            AppLocalizations.of(context).btn_follow,
                          ))),
                ],
              )),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(AppLocalizations.of(context).lbl_followers),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('0')
                      ],
                    ),
                    Column(
                      children: [
                        Text(AppLocalizations.of(context).lbl_followings),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('0')
                      ],
                    ),
                    Column(
                      children: [
                        Text(AppLocalizations.of(context).lbl_reviews),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('0')
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: const Divider(
                thickness: 1,
                height: 10,
              )),
          Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppLocalizations.of(context).txt_badges,
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              )),
          Container(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: const Divider(
                thickness: 1,
                height: 10,
              )),
          Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(AppLocalizations.of(context).txt_about,
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              )),
        ],
      ),
    );
  }
}
