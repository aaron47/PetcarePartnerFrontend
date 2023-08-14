import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/models/businessLayer/global.dart' as global;

class OrderListScreen extends BaseRoute {
  // OrderListScreen() : super();
  OrderListScreen({a, o}) : super(a: a, o: o, r: 'OrderListScreen');
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends BaseRouteState {
  _OrderListScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).lbl_orders,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Container(
                      height: 130,
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Card(
                          child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: global.isRTL
                                          ? const EdgeInsets.only(right: 5)
                                          : const EdgeInsets.only(
                                              left: 5,
                                            ),
                                      child: Text(
                                        'Rahul',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: global.isRTL
                                          ? const EdgeInsets.only(right: 5)
                                          : const EdgeInsets.only(
                                              left: 5,
                                            ),
                                      child: Text(
                                        '9825092850',
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 13),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: global.isRTL
                                              ? const EdgeInsets.only(right: 5)
                                              : const EdgeInsets.only(
                                                  left: 5,
                                                ),
                                          child: SizedBox(
                                              height: 60,
                                              width: 60,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5)),
                                                child: Image.asset(
                                                  'assets/images/dogfood.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: global.isRTL
                                                      ? const EdgeInsets.only(
                                                          right: 10)
                                                      : const EdgeInsets.only(
                                                          left: 10,
                                                        ),
                                                  child: Text(
                                                    'Dog Food',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: global.isRTL
                                                      ? const EdgeInsets.only(
                                                          right: 10)
                                                      : const EdgeInsets.only(
                                                          left: 10,
                                                        ),
                                                  child: Text(
                                                    '1 kg',
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              // color: Colors.red,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      height: 30,
                                      width: 130,
                                      decoration: const BoxDecoration(
                                          color: Color(0xffdddff5),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      padding: const EdgeInsets.all(4),
                                      child: Center(
                                        child: Text(
                                          'Pending',
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3, right: 5),
                                    child: Text(
                                      '2021-09-20',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, bottom: 2, right: 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Container(
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius: global.isRTL
                                                  ? BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(5.0),
                                                      bottomRight:
                                                          Radius.circular(5.0),
                                                    )
                                                  : BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5.0),
                                                      bottomLeft:
                                                          Radius.circular(5.0),
                                                    ),
                                              color: Colors.grey[350],
                                              border: Border.all(
                                                color: Colors.grey[350],
                                              ),
                                            ),
                                            height: 25,
                                            child: Center(
                                              child: Text(
                                                'qty',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 25,
                                          width: 40,
                                          // padding: EdgeInsets.all(4),
                                          child: Center(
                                            child: Text(
                                              "1",
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: global.isRTL
                                                ? BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(5.0),
                                                    bottomLeft:
                                                        Radius.circular(5.0),
                                                  )
                                                : BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(5.0),
                                                    bottomRight:
                                                        Radius.circular(5.0),
                                                  ),
                                            border: Border.all(
                                              color: Colors.grey[350],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2, bottom: 2, right: 5),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          child: Container(
                                            width: 70,
                                            decoration: BoxDecoration(
                                              borderRadius: global.isRTL
                                                  ? BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(5.0),
                                                      bottomRight:
                                                          Radius.circular(5.0),
                                                    )
                                                  : BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(5.0),
                                                      bottomLeft:
                                                          Radius.circular(5.0),
                                                    ),
                                              color: Colors.grey[350],
                                              border: Border.all(
                                                color: Colors.grey[350],
                                              ),
                                            ),
                                            // padding: EdgeInsets.all(4),
                                            height: 25,
                                            child: const Center(
                                              child: Text(
                                                'COD',
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 25,
                                          width: 70,
                                          // padding: EdgeInsets.all(4),
                                          child: const Center(
                                            child: Text(
                                              'Rs.180',
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: global.isRTL
                                                ? BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(5.0),
                                                    bottomLeft:
                                                        Radius.circular(5.0),
                                                  )
                                                : BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(5.0),
                                                    bottomRight:
                                                        Radius.circular(5.0),
                                                  ),
                                            border: Border.all(
                                              color: Colors.grey[350],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                    );
                    ;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
