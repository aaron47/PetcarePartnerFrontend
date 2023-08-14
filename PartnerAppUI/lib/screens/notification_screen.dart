import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationScreen extends BaseRoute {
  NotificationScreen({a, o}) : super(a: a, o: o, r: 'NotificationScreen');
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends BaseRouteState {
  List _notificationList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).lbl_notifications),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Card(
                          child: ListTile(
                        leading: CircleAvatar(
                            child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/images/userprofile.jpg",
                          ),
                        )),
                        title: Text(
                          'Mohamed Patel',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          'Best Pet services in this area',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      )),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
