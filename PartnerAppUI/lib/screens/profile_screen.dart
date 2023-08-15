import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/notification_screen.dart';
import 'package:pet_patner_demo/screens/service_detail_screen.dart';
import 'package:pet_patner_demo/screens/update_profile_screen.dart';
import 'package:pet_patner_demo/widgets/drawer_widget.dart';

import '../controllers/ApiController.dart';

class ProfileScreen extends BaseRoute {
  ProfileScreen({a, o}) : super(a: a, o: o, r: 'ProfileScreen');

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseRouteState {
  final ApiController apiController = Get.find<ApiController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await apiController.fetchUserServices(apiController.user.value.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context).lbl_profile,
        ),
        actions: [
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.bell),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/userprofile.jpg'),
                      radius: 40,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.only(
                          left: 1,
                        ),
                        title: Text(apiController.user.value.fullName,
                            style:
                                Theme.of(context).primaryTextTheme.headline5),
                        subtitle:
                            Text(apiController.user.value.role.capitalizeFirst),
                      ),
                    ],
                  )),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context).lbl_balance,
                              style:
                                  Theme.of(context).accentTextTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '0',
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context).lbl_creadits,
                              style:
                                  Theme.of(context).accentTextTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('3'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context).lbl_review,
                              style:
                                  Theme.of(context).accentTextTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('0'),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              AppLocalizations.of(context).lbl_blogs,
                              style:
                                  Theme.of(context).accentTextTheme.bodyText1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('0/7'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Divider(
                    thickness: 1,
                    height: 10,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(AppLocalizations.of(context).lbl_about,
                          style: Theme.of(context).accentTextTheme.bodyText1),
                      Text(
                        'Meilleur vétérinaire à Sousse',
                        style: Theme.of(context).primaryTextTheme.bodyText1,
                      )
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Divider(
                    thickness: 1,
                    height: 10,
                  )),
              SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(AppLocalizations.of(context).lbl_services,
                            style: Theme.of(context).accentTextTheme.bodyText1),
                        SizedBox(
                          height: 400,
                          child: Obx(() {
                            if (apiController.isLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            return ListView.builder(
                              itemCount: apiController.services.length,
                              itemBuilder: (BuildContext ctx, int index) {
                                return Card(
                                  elevation: 2,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        contentPadding: const EdgeInsets.all(5),
                                        leading: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: const CircleAvatar(
                                            backgroundImage: AssetImage(
                                                'assets/images/petboarding.png'),
                                            radius: 30,
                                          ),
                                        ),
                                        title: Text(apiController
                                            .services[index].serviceName),
                                        subtitle: Text(''),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15),
                                          child: const Divider(
                                            height: 5,
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              // color: Colors.red,
                                              height: 38,
                                              margin: const EdgeInsets.all(10),
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
                                                    AppLocalizations.of(context)
                                                        .btn_edit,
                                                  ))),
                                          Container(
                                              // color: Colors.red,
                                              height: 38,
                                              margin: const EdgeInsets.all(10),
                                              width: 100,
                                              child: TextButton(
                                                  onPressed: () {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //       builder: (context) =>
                                                    //           ServiceDetailViewScreen()),
                                                    // );
                                                  },
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .btn_view,
                                                  ))),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
