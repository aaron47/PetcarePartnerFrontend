import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/models/businessLayer/global.dart' as global;

class ServiceDetailViewScreen extends BaseRoute {
  ServiceDetailViewScreen({a, o})
      : super(a: a, o: o, r: 'ServiceDetailViewScreen');
  @override
  _ServiceDetailViewScreenState createState() =>
      _ServiceDetailViewScreenState();
}

class _ServiceDetailViewScreenState extends BaseRouteState {
  //List of images
  var images = [
    'assets/images/img1.jpg',
    'assets/images/pets1.jpg',
    'assets/images/img1.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).lbl_service_detail,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      child: imageSlider(context),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      bottom: 12,
                      child: Row(
                        children: [
                          Padding(
                            padding: global.isRTL
                                ? const EdgeInsets.only(left: 15)
                                : const EdgeInsets.only(right: 5),
                            child: CircleAvatar(
                                radius: 20,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                    'assets/images/userprofile.jpg',
                                  ),
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: Text(
                              'Adel',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Container(
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              AppLocalizations.of(context).lbl_service_summary,
                              style:
                                  Theme.of(context).primaryTextTheme.headline6,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('Pet services in this area',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodyText1),
                          ],
                        )),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    Container(
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .lbl_distance_willing_to_travel_to_visit_your_home,
                              style:
                                  Theme.of(context).primaryTextTheme.headline6,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.road,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('1-5KM',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1),
                              ],
                            ),
                          ],
                        )),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    Container(
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .lbl_accepted_dog_size,
                              style:
                                  Theme.of(context).primaryTextTheme.headline6,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.dog,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('1-5 Kg',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1),
                              ],
                            ),
                          ],
                        )),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    Container(
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .lbl_the_length_of_each_Walk,
                              style:
                                  Theme.of(context).primaryTextTheme.headline6,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.paw,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('1 Hours',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1),
                              ],
                            ),
                          ],
                        )),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    Container(
                        margin: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .lbl_last_minute_bookings,
                              style:
                                  Theme.of(context).primaryTextTheme.headline6,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.calendarTimes,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text('No',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .bodyText1),
                              ],
                            ),
                          ],
                        )),
                    const Divider(
                      height: 1,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //image slider for blogs images
  Swiper imageSlider(context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Stack(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          )
        ]);
      },
      itemCount: images.length,
      scale: 0.9,
    );
  }
}
