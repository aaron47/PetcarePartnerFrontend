import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pet_patner_demo/controllers/ApiController.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/notification_screen.dart';
import 'package:pet_patner_demo/screens/request_detail_screen.dart';
import 'package:pet_patner_demo/widgets/drawer_widget.dart';
import 'package:pet_patner_demo/models/businessLayer/global.dart' as global;

class RequestListScreen extends BaseRoute {
  RequestListScreen({a, o}) : super(a: a, o: o, r: 'RequestListScreen');
  @override
  _RequestListScreenState createState() => _RequestListScreenState();
}

class _RequestListScreenState extends BaseRouteState {
  final ApiController apiController = Get.find<ApiController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await apiController.fetchReservations();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of(context).lbl_requests,
        ),
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: const FaIcon(FontAwesomeIcons.bell),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: DefaultTabController(
            length: 4,
            child: Obx(
              () => apiController.isLoadingReservation.value
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          indicatorColor: Theme.of(context).primaryColor,
                          labelColor: Theme.of(context).primaryColor,
                          unselectedLabelColor: const Color(0xffACB1C0),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          tabs: [
                            Tab(
                              child: Text(
                                AppLocalizations.of(context).lbl_all,
                              ),
                            ),
                            Tab(
                              child: Text(
                                "En attente",
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Accepté",
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Refusé",
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                            child: TabBarView(children: [
                          //first tab cotroller
                          Column(children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 200,
                              child: ListView.builder(
                                itemCount: apiController.reservations.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RequestDetailScreen(),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      margin: const EdgeInsets.all(5),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(apiController
                                                .reservations[index]
                                                .user
                                                .fullName),
                                            subtitle: Text(
                                                "${apiController.reservations[index].prixTotal.toString()} TND"),
                                            trailing: Text(
                                              apiController.reservations[index]
                                                          .status ==
                                                      'pending'
                                                  ? 'En attente'
                                                  : apiController
                                                              .reservations[
                                                                  index]
                                                              .status ==
                                                          'accepted'
                                                      ? 'Accepté'
                                                      : 'Refusé',
                                              style: TextStyle(
                                                color: apiController
                                                            .reservations[index]
                                                            .status ==
                                                        'pending'
                                                    ? Colors.orange
                                                    : apiController
                                                                .reservations[
                                                                    index]
                                                                .status ==
                                                            'accepted'
                                                        ? Colors.green
                                                        : Colors.red,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: global.isRTL
                                                ? const EdgeInsets.only(
                                                    right: 10)
                                                : const EdgeInsets.only(
                                                    left: 10),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.bungalow,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(apiController
                                                    .reservations[index]
                                                    .service
                                                    .serviceName)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: global.isRTL
                                                ? const EdgeInsets.only(
                                                    right: 10)
                                                : const EdgeInsets.only(
                                                    left: 10),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  color: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    "${apiController.reservations[index].dateDeb} - ${apiController.reservations[index].dateFin}")
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                              left: 15,
                                              right: 15,
                                            ),
                                            child: const Divider(
                                              height: 5,
                                            ),
                                          ),
                                          apiController.reservations[index]
                                                          .status !=
                                                      "accepted" &&
                                                  apiController
                                                          .reservations[index]
                                                          .status !=
                                                      "declined"
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 38,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              10),
                                                      width: 100,
                                                      child: OutlinedButton(
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          side: BorderSide(
                                                            width: 1.0,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          declineDialog(
                                                              apiController
                                                                  .reservations[
                                                                      index]
                                                                  .id);
                                                        },
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .btn_decline,
                                                          style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 38,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              10),
                                                      width: 100,
                                                      child: TextButton(
                                                        onPressed: () {
                                                          acceptDialog(
                                                              apiController
                                                                  .reservations[
                                                                      index]
                                                                  .id);
                                                        },
                                                        child: Text(
                                                          AppLocalizations.of(
                                                                  context)
                                                              .btn_accept,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ]),
                          //second tab controller
                          Column(children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 200,
                              child: ListView.builder(
                                itemCount: apiController.reservations.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  if (apiController
                                          .reservations[index].status ==
                                      "pending") {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RequestDetailScreen(),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        margin: const EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(apiController
                                                  .reservations[index]
                                                  .user
                                                  .fullName),
                                              subtitle: Text(
                                                  "${apiController.reservations[index].prixTotal.toString()} TND"),
                                              trailing: Text(
                                                apiController
                                                            .reservations[index]
                                                            .status ==
                                                        'pending'
                                                    ? 'En attente'
                                                    : apiController
                                                                .reservations[
                                                                    index]
                                                                .status ==
                                                            'accepted'
                                                        ? 'Accepté'
                                                        : 'Refusé',
                                                style: TextStyle(
                                                  color: apiController
                                                              .reservations[
                                                                  index]
                                                              .status ==
                                                          'pending'
                                                      ? Colors.orange
                                                      : apiController
                                                                  .reservations[
                                                                      index]
                                                                  .status ==
                                                              'accepted'
                                                          ? Colors.green
                                                          : Colors.red,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: global.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 10)
                                                  : const EdgeInsets.only(
                                                      left: 10),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.bungalow,
                                                    color: Colors.black,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(apiController
                                                      .reservations[index]
                                                      .service
                                                      .serviceName)
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: global.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 10)
                                                  : const EdgeInsets.only(
                                                      left: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time,
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      "${apiController.reservations[index].dateDeb} - ${apiController.reservations[index].dateFin}")
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                              ),
                                              child: const Divider(
                                                height: 5,
                                              ),
                                            ),
                                            apiController.reservations[index]
                                                            .status !=
                                                        "accepted" &&
                                                    apiController
                                                            .reservations[index]
                                                            .status !=
                                                        "declined"
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 38,
                                                        margin: const EdgeInsets
                                                            .all(10),
                                                        width: 100,
                                                        child: OutlinedButton(
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                            side: BorderSide(
                                                              width: 1.0,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            declineDialog(
                                                                apiController
                                                                    .reservations[
                                                                        index]
                                                                    .id);
                                                          },
                                                          child: Text(
                                                            AppLocalizations.of(
                                                                    context)
                                                                .btn_decline,
                                                            style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 38,
                                                        margin: const EdgeInsets
                                                            .all(10),
                                                        width: 100,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            acceptDialog(
                                                                apiController
                                                                    .reservations[
                                                                        index]
                                                                    .id);
                                                          },
                                                          child: Text(
                                                            AppLocalizations.of(
                                                                    context)
                                                                .btn_accept,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            )
                          ]),
                          //third tab controller
                          Column(children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 200,
                              child: ListView.builder(
                                itemCount: apiController.reservations.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  if (apiController
                                          .reservations[index].status ==
                                      "accepted") {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RequestDetailScreen(),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        margin: const EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(apiController
                                                  .reservations[index]
                                                  .user
                                                  .fullName),
                                              subtitle: Text(
                                                  "${apiController.reservations[index].prixTotal.toString()} TND"),
                                              trailing: Text(
                                                apiController
                                                            .reservations[index]
                                                            .status ==
                                                        'pending'
                                                    ? 'En attente'
                                                    : apiController
                                                                .reservations[
                                                                    index]
                                                                .status ==
                                                            'accepted'
                                                        ? 'Accepté'
                                                        : 'Refusé',
                                                style: TextStyle(
                                                  color: apiController
                                                              .reservations[
                                                                  index]
                                                              .status ==
                                                          'pending'
                                                      ? Colors.orange
                                                      : apiController
                                                                  .reservations[
                                                                      index]
                                                                  .status ==
                                                              'accepted'
                                                          ? Colors.green
                                                          : Colors.red,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: global.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 10)
                                                  : const EdgeInsets.only(
                                                      left: 10),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.bungalow,
                                                    color: Colors.black,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(apiController
                                                      .reservations[index]
                                                      .service
                                                      .serviceName)
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: global.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 10)
                                                  : const EdgeInsets.only(
                                                      left: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time,
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      "${apiController.reservations[index].dateDeb} - ${apiController.reservations[index].dateFin}")
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                              ),
                                              child: const Divider(
                                                height: 5,
                                              ),
                                            ),
                                            apiController.reservations[index]
                                                            .status !=
                                                        "accepted" &&
                                                    apiController
                                                            .reservations[index]
                                                            .status !=
                                                        "declined"
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 38,
                                                        margin: const EdgeInsets
                                                            .all(10),
                                                        width: 100,
                                                        child: OutlinedButton(
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                            side: BorderSide(
                                                              width: 1.0,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            declineDialog(
                                                                apiController
                                                                    .reservations[
                                                                        index]
                                                                    .id);
                                                          },
                                                          child: Text(
                                                            AppLocalizations.of(
                                                                    context)
                                                                .btn_decline,
                                                            style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 38,
                                                        margin: const EdgeInsets
                                                            .all(10),
                                                        width: 100,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            acceptDialog(
                                                                apiController
                                                                    .reservations[
                                                                        index]
                                                                    .id);
                                                          },
                                                          child: Text(
                                                            AppLocalizations.of(
                                                                    context)
                                                                .btn_accept,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            )
                          ]),
                          //forth tab controller
                          Column(children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height - 200,
                              child: ListView.builder(
                                itemCount: apiController.reservations.length,
                                itemBuilder: (BuildContext ctx, int index) {
                                  if (apiController
                                          .reservations[index].status ==
                                      "declined") {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RequestDetailScreen(),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        margin: const EdgeInsets.all(5),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Text(apiController
                                                  .reservations[index]
                                                  .user
                                                  .fullName),
                                              subtitle: Text(
                                                  "${apiController.reservations[index].prixTotal.toString()} TND"),
                                              trailing: Text(
                                                apiController
                                                            .reservations[index]
                                                            .status ==
                                                        'pending'
                                                    ? 'En attente'
                                                    : apiController
                                                                .reservations[
                                                                    index]
                                                                .status ==
                                                            'accepted'
                                                        ? 'Accepté'
                                                        : 'Refusé',
                                                style: TextStyle(
                                                  color: apiController
                                                              .reservations[
                                                                  index]
                                                              .status ==
                                                          'pending'
                                                      ? Colors.orange
                                                      : apiController
                                                                  .reservations[
                                                                      index]
                                                                  .status ==
                                                              'accepted'
                                                          ? Colors.green
                                                          : Colors.red,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: global.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 10)
                                                  : const EdgeInsets.only(
                                                      left: 10),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.bungalow,
                                                    color: Colors.black,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(apiController
                                                      .reservations[index]
                                                      .service
                                                      .serviceName)
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: global.isRTL
                                                  ? const EdgeInsets.only(
                                                      right: 10)
                                                  : const EdgeInsets.only(
                                                      left: 10),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time,
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                      "${apiController.reservations[index].dateDeb} - ${apiController.reservations[index].dateFin}")
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                              ),
                                              child: const Divider(
                                                height: 5,
                                              ),
                                            ),
                                            apiController.reservations[index]
                                                            .status !=
                                                        "accepted" &&
                                                    apiController
                                                            .reservations[index]
                                                            .status !=
                                                        "declined"
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        height: 38,
                                                        margin: const EdgeInsets
                                                            .all(10),
                                                        width: 100,
                                                        child: OutlinedButton(
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                            side: BorderSide(
                                                              width: 1.0,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            declineDialog(
                                                                apiController
                                                                    .reservations[
                                                                        index]
                                                                    .id);
                                                          },
                                                          child: Text(
                                                            AppLocalizations.of(
                                                                    context)
                                                                .btn_decline,
                                                            style: TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 38,
                                                        margin: const EdgeInsets
                                                            .all(10),
                                                        width: 100,
                                                        child: TextButton(
                                                          onPressed: () {
                                                            acceptDialog(
                                                                apiController
                                                                    .reservations[
                                                                        index]
                                                                    .id);
                                                          },
                                                          child: Text(
                                                            AppLocalizations.of(
                                                                    context)
                                                                .btn_accept,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return SizedBox();
                                  }
                                },
                              ),
                            )
                          ]),
                        ]))
                      ],
                    ),
            ),

            // TabBarView(children: [Text('data'), Text('data'), Text('data')])
          ),
        ),

        //main scaffold
      ),
    );
  }

  acceptDialog(String id) async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: Text("Etes vous sur?"),
                content: Text('Voulez vous continuer?'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      AppLocalizations.of(context).btn_cancel,
                      style: const TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      // Dismiss the dialog but don't
                      // dismiss the swiped item
                      return Navigator.of(context).pop(false);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("Confirmer"),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              color: Colors.grey[300],
                              width: 70.0,
                              height: 70.0,
                              child: new Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: new Center(
                                      child: new CircularProgressIndicator())),
                            ),
                          );
                        },
                      );
                      var result = await apiController.acceptRequest(id);
                      if (result.status == true) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          await apiController.fetchReservations();
                        });
                      } else {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Erreur'),
                              content: Text("Erreur serveur"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          });
    } catch (e) {
      print('Exception - base.dart - exitAppDialog(): ' + e.toString());
    }
  }

  declineDialog(String id) async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: Text(
                  "Request",
                ),
                content: Text('Are you want to decline request'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      AppLocalizations.of(context).btn_cancel,
                      style: const TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      // Dismiss the dialog but don't
                      // dismiss the swiped item
                      return Navigator.of(context).pop(false);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('Decline'),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: Container(
                              color: Colors.grey[300],
                              width: 70.0,
                              height: 70.0,
                              child: new Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: new Center(
                                      child: new CircularProgressIndicator())),
                            ),
                          );
                        },
                      );
                      var result = await apiController.declineRequest(id);
                      if (result.status == true) {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          await apiController.fetchReservations();
                        });
                      } else {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Erreur'),
                              content: Text("Erreur serveur"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(a: widget.analytics, o: widget.observer)));
                    },
                  ),
                ],
              ),
            );
          });
    } catch (e) {
      print('Exception - base.dart - exitAppDialog(): ' + e.toString());
    }
  }
}
