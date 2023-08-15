import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/network/remote/Requests/add_offering_user_request.dart';
import 'package:pet_patner_demo/screens/document_verification_screen.dart';
import 'package:pet_patner_demo/screens/login_screen.dart';

import '../controllers/ApiController.dart';

class ServiceSelectionScreen extends BaseRoute {
  ServiceSelectionScreen({a, o})
      : super(a: a, o: o, r: 'ServiceSelectionScreen');

  @override
  _ServiceSelectionScreenState createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends BaseRouteState {
  Map<String, Map<String, dynamic>> numbers = {
    'Hebergement pour animaux': {
      "value": false,
      "id": "64dbb0412acff23951e6f3f1",
    },
    "Promenade d'animaux": {
      "value": false,
      "id": "64dbb0742acff23951e6f3f4",
    },
    'Vétérinaire': {
      "value": false,
      "id": "64dbb0872acff23951e6f3f7",
    },
    'Marche Produits': {
      "value": false,
      "id": "64dbb0972acff23951e6f3fa",
    },
  };

  var holder_1 = [];
  final ApiController apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/partnerbaner.jpg'),
                    //image: AssetImage('assets/images/dogcat.jpg'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              )
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Selectionnez vos services",
                  style: Theme.of(context).primaryTextTheme.headline4,
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: ListView(
                          children: numbers.keys.map((String key) {
                            return CheckboxListTile(
                              title: Text(
                                key,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              value: numbers[key]["value"],
                              activeColor: Theme.of(context).primaryColor,
                              checkColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  numbers[key]["value"] = value;
                                });
                              },
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  Container(
                      // color: Colors.red,
                      height: 45,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          onPressed: () async {
                            numbers.forEach((key, value) async {
                              if (value["value"] == true) {
                                var addOfferingUserRequest =
                                    AddOfferingUserRequest(
                                        serviceId: value["id"],
                                        userEmail:
                                            apiController.user.value.email);
                                await apiController
                                    .addOfferingUser(addOfferingUserRequest);
                              }
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context).btn_next,
                          )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getItems() {
    numbers.forEach((key, value) {
      if (value["value"] == true) {
        holder_1.add(value["id"]);
      }
    });

    //print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }
}
