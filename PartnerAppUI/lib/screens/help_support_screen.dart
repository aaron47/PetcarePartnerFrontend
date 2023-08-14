import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpAndSupportScreen extends BaseRoute {
  HelpAndSupportScreen({a, o}) : super(a: a, o: o, r: 'HelpAndSupportScreen');
  @override
  _HelpAndSupportScreenState createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends BaseRouteState {
  _HelpAndSupportScreenState() : super();

  File imageFile;
  File _tImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).lbl_help_supports),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8, top: 20, right: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Card(
                    // margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).lbl_email,
                        hintText: AppLocalizations.of(context)
                            .hnt_enter_email_address,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
                  child: GestureDetector(
                    onTap: () {
                      _showCupertinoModalSheet();
                    },
                    child: DottedBorder(
                      color: Theme.of(context).primaryColor,
                      strokeWidth: 1,
                      dashPattern: const [10, 6],
                      child: _tImage == null
                          ? GestureDetector(
                              onTap: () {
                                _showCupertinoModalSheet();
                              },
                              child: SizedBox(
                                height: 250,
                                width: double.infinity,
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
                                _showCupertinoModalSheet();
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
        ),
        bottomNavigationBar: Container(
            height: 45,
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context).btn_submit,
                ))));
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
}
