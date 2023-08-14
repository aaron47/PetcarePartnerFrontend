import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/about_me_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceListScreen extends BaseRoute {
  ServiceListScreen({a, o}) : super(a: a, o: o, r: 'ServiceListScreen');
  @override
  _ServiceListScreenState createState() => _ServiceListScreenState();
}

class _ServiceListScreenState extends BaseRouteState {
  List<String> title = [
    "Pet Boarding",
    "Dog Walking",
    "Veterinarian",
  ];
  List<String> subtitle = [
    "Perfect if the pet needs overnight pet care.",
    "For dogs that need a walk or two.",
    "Most veterinarians diagnose animal health problems",
  ];
  List<String> img = [
    'assets/images/petboarding.png',
    'assets/images/petwalking.png',
    'assets/images/veterinaran.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(AppLocalizations.of(context).lbl_services),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext ctxt, int index) {
                return SizedBox(
                  height: 85,
                  child: Card(
                    margin: const EdgeInsets.only(top: 8),
                    child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutmeScreen()),
                          );
                        },
                        contentPadding: const EdgeInsets.all(5),
                        leading: Padding(
                          padding: const EdgeInsets.only(right: 5, bottom: 8),
                          child: CircleAvatar(
                              radius: 30,
                              child: CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(img[index]))),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(
                            title[index],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            subtitle[index],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        trailing: Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: const Icon(Icons.arrow_forward_ios))),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
