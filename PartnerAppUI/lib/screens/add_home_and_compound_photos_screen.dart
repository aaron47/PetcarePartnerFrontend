import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/verification_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddHomeAndCompoundPhotosScreen extends BaseRoute {
  AddHomeAndCompoundPhotosScreen({a, o})
      : super(a: a, o: o, r: 'AddHomeAndCompoundPhotosScreen');
  @override
  _AddHomeAndCompoundPhotosScreenState createState() =>
      _AddHomeAndCompoundPhotosScreenState();
}

class _AddHomeAndCompoundPhotosScreenState extends BaseRouteState {
  File imageFile;
  File _tImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).lbl_add_home_photos),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 10, right: 10, bottom: 10),
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
                    MaterialPageRoute(
                        builder: (context) => VerificationScreen()),
                  );
                },
                child: Text(
                  AppLocalizations.of(context).btn_next,
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
