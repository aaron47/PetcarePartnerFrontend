import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/document_verification_screen.dart';
import 'package:pet_patner_demo/screens/login_screen.dart';

class ServiceSelectionScreen extends BaseRoute {
  ServiceSelectionScreen({a, o}) : super(a: a, o: o, r: 'ServiceSelectionScreen');
  @override
  _ServiceSelectionScreenState createState() => _ServiceSelectionScreenState();
}

class _ServiceSelectionScreenState extends BaseRouteState {
  Map<String, bool> numbers = {
    'Pet Bording': false,
    'Dog Walking': false,
    'Veterinarian': false,
    'Product Store': false,
  };

  var holder_1 = [];

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
                  AppLocalizations.of(context).lbl_select_your_services,
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
                              value: numbers[key],
                              activeColor: Theme.of(context).primaryColor,
                              checkColor: Colors.white,
                              onChanged: (bool value) {
                                setState(() {
                                  numbers[key] = value;
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DocumentVerificationScreen()),
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
      if (value == true) {
        holder_1.add(key);
      }
    });

    //print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }
}
