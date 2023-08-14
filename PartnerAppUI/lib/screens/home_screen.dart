import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/notification_screen.dart';
import 'package:pet_patner_demo/widgets/drawer_widget.dart';

class HomeScreen extends BaseRoute {
  HomeScreen({a, o}) : super(a: a, o: o, r: 'HomeScreen');
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseRouteState {
  List<String> _days = [];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
          drawer: DrawerWidget(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                Icons.menu,
              ),
            ),
            title: Text(
              AppLocalizations.of(context).lbl_home_screen,
            ),
            actions: [
              Container(
                  padding: const EdgeInsets.all(10),
                  child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.bell),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationScreen()),
                        );
                      }))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                      elevation: 2,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, top: 10, left: 10),
                            child: Text(
                              AppLocalizations.of(context).lbl_weekly_earn,
                            ),
                          ),
                          Container(
                              //color: Colors.yellow,
                              padding: const EdgeInsets.only(bottom: 10),
                              margin: const EdgeInsets.only(
                                  top: 5, left: 10, right: 10, bottom: 5),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: _charts())
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 130,
                          child: Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .lbl_todays_earning,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline6,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const FaIcon(
                                          FontAwesomeIcons.rupeeSign,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Text(
                                            '1000',
                                            style: TextStyle(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          height: 130,
                          child: Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .lbl_todays_orders,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline6,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      '5',
                                      style: TextStyle(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 130,
                          child: Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .lbl_todays_service,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline6,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const FaIcon(
                                          FontAwesomeIcons.rupeeSign,
                                          color: Colors.black,
                                          size: 15,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Text(
                                            '1000',
                                            style: TextStyle(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 160,
                          height: 130,
                          child: Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Text(
                                      AppLocalizations.of(context)
                                          .lbl_todays_requests,
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .headline6,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      '7',
                                      style: TextStyle(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 15, top: 5),
                    height: MediaQuery.of(context).size.height * 0.27,
                    width: MediaQuery.of(context).size.width - 25,
                    padding: const EdgeInsets.only(),
                    child: Card(
                      elevation: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Text(
                                AppLocalizations.of(context)
                                    .lbl_completed_goals,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline6,
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: CircularPercentIndicator(
                                  radius: 85.0,
                                  lineWidth: 12.0,
                                  percent: 0.6,
                                  center: const Text("1.5"),
                                  progressColor: Theme.of(context).primaryColor,
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    _days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  }

  _charts() {
    final barGroups = <BarChartGroupData>[
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
              y: 2.5,
              colors: [Colors.red],
              width: 22,
              borderRadius: BorderRadius.zero),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
              y: 5.0,
              colors: [Colors.blue],
              width: 22,
              borderRadius: BorderRadius.zero),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
              y: 4.5,
              colors: [Colors.yellow],
              width: 22,
              borderRadius: BorderRadius.zero),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
              y: 10.0,
              colors: [Colors.green],
              width: 22,
              borderRadius: BorderRadius.zero),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
              y: 15,
              colors: [Colors.pink],
              width: 22,
              borderRadius: BorderRadius.zero),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
              y: 15,
              colors: [Colors.green],
              width: 22,
              borderRadius: BorderRadius.zero),
        ],
      ),
    ];

    final barChartData = BarChartData(
      barGroups: barGroups,
      barTouchData: BarTouchData(
        allowTouchBarBackDraw: false,
        enabled: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(show: false),
      axisTitleData: FlAxisTitleData(
        show: false,
      ),
      titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
              showTitles: true,
              getTitles: (double val) => _days[(val.toInt())]),
          leftTitles: SideTitles(
            showTitles: false,
            getTitles: (double val) {
              if (val.toInt() % 5 != 0) return '';
              return '${val.toInt() * 10}';
            },
          ),
          rightTitles: SideTitles(showTitles: false),
          topTitles: SideTitles(showTitles: false)),
    );

    return BarChart(
      barChartData,
      swapAnimationDuration: const Duration(milliseconds: 500),
    );
  }
}
