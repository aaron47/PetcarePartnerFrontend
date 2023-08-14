import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/add_products_screen.dart';

class ProductListScreen extends BaseRoute {
  ProductListScreen({a, o}) : super(a: a, o: o, r: 'ProductListScreen');
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends BaseRouteState {
  List<String> _productname = ['Dog Food', 'Cat Food', 'Dog Belt'];
  List<String> _productprice = ['100', '80', '280'];
  List<String> _productqty = ['10', '5', '1'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).lbl_products,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                //margin: const EdgeInsets.all(10),
                child: ListView.builder(
                    //itemCount: _productList.length,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 90,
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Card(
                            elevation: 2,
                            child: Row(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7)),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        height: 85,
                                        width: 80,
                                        //Product image
                                        child: Image.asset(
                                          'assets/images/dogfood.png',
                                          //   fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 7),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //Product Name
                                        Text(
                                          _productname[index],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        //Description
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 1),
                                          child: Text(
                                            'Products Decription add heredskjvbhsivhslkdshlv',
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .bodyText2,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        //quantity
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            _productqty[index],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  height: 40,
                                  width: 100,
                                  child: Row(
                                    children: [
                                      DottedBorder(
                                        color: Theme.of(context).primaryColor,
                                        child: Container(
                                          height: 25,
                                          width: 60,
                                          padding: const EdgeInsets.only(
                                              top: 2, bottom: 2),
                                          child: Center(
                                              child: Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const FaIcon(
                                                FontAwesomeIcons.rupeeSign,
                                                color: Colors.black,
                                                size: 15,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 3.0),
                                                child: Text(
                                                  _productprice[index],
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          )),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                        child: PopupMenuButton(
                                            icon: const Icon(Icons.more_vert,
                                                color: Colors.black),
                                            itemBuilder:
                                                (BuildContext context) {
                                              return [
                                                PopupMenuItem(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: ListTile(
                                                    leading: Icon(
                                                      Icons.edit,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                    title: Text(
                                                        AppLocalizations.of(
                                                                context)
                                                            .btn_edit),
                                                    onTap: () {},
                                                  ),
                                                ),
                                                PopupMenuItem(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: ListTile(
                                                    leading: Icon(
                                                      Icons.delete,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                    title: Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .lbl_delete,
                                                    ),
                                                    onTap: () {
                                                      deleteDialog();
                                                    },
                                                  ),
                                                ),
                                              ];
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      );
                    }),
              )
              //:
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          // color: Colors.red,
          height: 45,
          padding: const EdgeInsets.only(left: 15, right: 15),
          margin: const EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductsScreen()),
                );
              },
              child: Text(
                AppLocalizations.of(context).lbl_add_new_product,
              ))),
    );
  }

  deleteDialog() async {
    try {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return Theme(
              data: ThemeData(dialogBackgroundColor: Colors.white),
              child: CupertinoAlertDialog(
                title: Text("Delete"),
                content: Text('Are your sure to delete this product?'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text(
                      AppLocalizations.of(context).btn_cancel,
                      style: const TextStyle(color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text('Delete'),
                    onPressed: () async {
                      Navigator.of(context).pop();
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
