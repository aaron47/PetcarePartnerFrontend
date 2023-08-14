import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';

class AddProductsScreen extends BaseRoute {
  AddProductsScreen({a, o}) : super(a: a, o: o, r: 'AddProductsScreen');
  @override
  _AddProductsScreenState createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends BaseRouteState {
  File imageFile;
  File _tImage;
  String _producttype;
  String _productunittype;
  //String _category;

  bool add = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).lbl_add_new_product,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                  //margin: const EdgeInsets.all(5),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).lbl_product_name,
                      hintText:
                          AppLocalizations.of(context).hnt_enter_productname,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: _productunittype,
                  items: [
                    'Food',
                    'Toys',
                    'Hygiene',
                    'Clothing',
                    'Accessories',
                    'Beds & creates'
                  ]
                      .map((label) => DropdownMenuItem(
                            child: Text(label.toString()),
                            value: label,
                          ))
                      .toList(),
                  hint: Text(
                    'Category',
                    style: Theme.of(context).inputDecorationTheme.labelStyle,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _productunittype = value;
                    });
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10),
              //   child: Card(
              //     //margin: const EdgeInsets.all(5),
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //         labelText: AppLocalizations.of(context).lbl_price,
              //         hintText:
              //             AppLocalizations.of(context).hnt_enter_productprice,
              //       ),
              //       keyboardType: TextInputType.number,
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context).lbl_product_description,
                      hintText: AppLocalizations.of(context)
                          .hnt_enter_product_details_description,
                    ),
                    maxLines: 3,
                  ),
                ),
              ),
              // Card(
              //   margin: const EdgeInsets.all(5),
              //   child: TextFormField(
              //     decoration: InputDecoration(
              //       labelText:
              //           AppLocalizations.of(context).lbl_product_quantity,
              //       hintText: AppLocalizations.of(context).hnt_product_qantity,
              //     ),
              //     //keyboardType: TextInputType.number,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Units',
                                style: Theme.of(context)
                                    .inputDecorationTheme
                                    .labelStyle),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)
                                        .lbl_product_quantity,
                                    hintText: AppLocalizations.of(context)
                                        .hnt_product_qantity,
                                  ),
                                  keyboardType: TextInputType.number,
                                )),
                          ),
                          Flexible(
                            child: Card(
                              elevation: 2,
                              child: SizedBox(
                                width: 350,
                                child: DropdownButtonFormField<String>(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  value: _producttype,
                                  items: [
                                    'Kg',
                                    'Grm',
                                    'PKT',
                                    'Pcs',
                                  ]
                                      .map((label) => DropdownMenuItem(
                                            child: Text(label.toString()),
                                            value: label,
                                          ))
                                      .toList(),
                                  hint: Text(
                                    ' Type',
                                    style: Theme.of(context)
                                        .inputDecorationTheme
                                        .labelStyle,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      _producttype = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Amount',
                                    hintText: 'Enter amount',
                                  ),
                                  keyboardType: TextInputType.number,
                                )),
                          ),
                          Flexible(
                              child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Container(
                                      // color: Colors.red,
                                      height: 45,
                                      // margin: const EdgeInsets.all(10),
                                      width: 500,
                                      child: TextButton(
                                          onPressed: () {
                                            add = !add;
                                            setState(() {});
                                          },
                                          child: Text(
                                            "Add",
                                          )))
                                  // Container(
                                  //     height: 45,
                                  //     width: 220,
                                  //     child: OutlinedButton(
                                  //         style: OutlinedButton.styleFrom(
                                  //           side: BorderSide(
                                  //               width: 1.0,
                                  //               color:
                                  //                   Theme.of(context).primaryColor),
                                  //         ),
                                  //         onPressed: () {
                                  //           add = !add;
                                  //           setState(() {});
                                  //         },
                                  //         child: Text(
                                  //           "Add",
                                  //           style: Theme.of(context)
                                  //               .primaryTextTheme
                                  //               .bodyText2,
                                  //         ))),
                                  ))
                        ],
                      ),
                      add
                          ? SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      color: Color(0xff8f8f8f),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('1'),
                                          Text('Kg'),
                                          Text('Rs.500'),
                                          Icon(Icons.cancel)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          _showCupertinoModalSheet();
                        },
                        child: DottedBorder(
                          color: Theme.of(context)
                              .primaryColor, //color of dotted/dash line
                          strokeWidth: 1, //thickness of dash/dots
                          dashPattern: const [10, 6],
                          child: _tImage == null
                              ? GestureDetector(
                                  onTap: () {
                                    _showCupertinoModalSheet();
                                  },
                                  child: SizedBox(
                                    //inner container
                                    height: 250, //height of inner container
                                    width: double
                                        .infinity, //width to 100% match to parent container.
                                    child: Center(
                                        child: Text(
                                      AppLocalizations.of(context)
                                          .lbl_tap_to_add_image,
                                      style: Theme.of(context)
                                          .inputDecorationTheme
                                          .labelStyle,
                                    )),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    _removeCupertinoModalSheet();
                                  },
                                  child: SizedBox(
                                    height: 250,
                                    width: double.infinity,
                                    child: Image.file(
                                      _tImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
                Navigator.of(context).pop();
              },
              child: Text(
                AppLocalizations.of(context).btn_save_product,
              ))),
    );
  }

  _showCupertinoModalSheet() {
    try {
      FocusScope.of(context).unfocus();
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text('Actions'),
          actions: [
            CupertinoActionSheetAction(
              child: Text('Take Picture',
                  style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br.openCamera();
                hideLoader();

                print('Image Path : ${_tImage.path}');
                setState(() {});
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Choose from gallery',
                  style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br.selectImageFromGallery();
                hideLoader();
                print('Image Path : ${_tImage.path}');
                setState(() {});
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel', style: TextStyle(color: Color(0xFFFA692C))),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    } catch (e) {
      print("Exception - addServicesScreen.dart - _showCupertinoModalSheet():" +
          e.toString());
    }
  }

  _removeCupertinoModalSheet() {
    try {
      FocusScope.of(context).unfocus();
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text('Actions'),
          actions: [
            CupertinoActionSheetAction(
              child: Text('Remove', style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                //  Navigator.pop(context);
                // showOnlyLoaderDialog();
                _tImage = null;
                hideLoader();

                setState(() {});
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Take Picture',
                  style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br.openCamera();
                hideLoader();

                print('Image Path : ${_tImage.path}');
                setState(() {});
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Choose from gallery',
                  style: TextStyle(color: Color(0xFF171D2C))),
              onPressed: () async {
                Navigator.pop(context);
                showOnlyLoaderDialog();
                _tImage = await br.selectImageFromGallery();
                hideLoader();
                print('Image Path : ${_tImage.path}');
                setState(() {});
              },
            )
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel', style: TextStyle(color: Color(0xFFFA692C))),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    } catch (e) {
      print("Exception - addServicesScreen.dart - _showCupertinoModalSheet():" +
          e.toString());
    }
  }
}
