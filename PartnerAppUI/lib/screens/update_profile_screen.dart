import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/profile_screen.dart';

class UpdateProfileScreen extends BaseRoute {
  UpdateProfileScreen({a, o}) : super(a: a, o: o, r: 'UpdateProfileScreen');
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends BaseRouteState {
  File _tImage;
  var _femail = new FocusNode();
  var _fmobile = new FocusNode();
  var _faddress = new FocusNode();
  var _faboutme = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).lbl_update_profile),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  const CircleAvatar(
                                    radius: 50,
                                    backgroundImage: AssetImage(
                                        'assets/images/userprofile.jpg'),
                                    //AssetImage(''),

                                    //    Image.asset('assets/images/userprofile.jpg'),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _showCupertinoModalSheet();
                                      //  FocusScope.of(context).unfocus();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      radius: 18,
                                      child: Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ]),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.all(15),
                          child: Text(
                              AppLocalizations.of(context)
                                  .txt_change_profile_picture,
                              style: Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle))
                    ],
                  ),
                ),
                Card(
                  //margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    autofocus: true,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_femail);
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).lbl_username,
                      hintText: AppLocalizations.of(context).lbl_enter_username,
                    ),
                  ),
                ),
                Card(
                  //margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    focusNode: _femail,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_fmobile);
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).lbl_email,
                      hintText: AppLocalizations.of(context).hnt_email,
                    ),
                  ),
                ),
                Card(
                  // margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    focusNode: _fmobile,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_faddress);
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).lbl_mobile_number,
                      hintText:
                          AppLocalizations.of(context).lbl_enter_mobile_number,
                    ),
                  ),
                ),
                Card(
                  //margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    focusNode: _faddress,
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(_faboutme);
                    },
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).lbl_address,
                      hintText: AppLocalizations.of(context)
                          .hnt_enter_your_address_details,
                    ),
                    maxLines: 3,
                  ),
                ),
                Card(
                  //margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    focusNode: _faboutme,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).lbl_about_me,
                      hintText: AppLocalizations.of(context)
                          .hnt_enter_about_your_details,
                    ),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
          // color: Colors.red,
          height: 45,
          padding: const EdgeInsets.only(left: 10, right: 10),
          margin: const EdgeInsets.only(bottom: 10),
          width: MediaQuery.of(context).size.width,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: Text(
                AppLocalizations.of(context).lbl_update,
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
}
