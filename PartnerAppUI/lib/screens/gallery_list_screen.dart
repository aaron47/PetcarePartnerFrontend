import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/dialogs/open_image_dialog.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/add_gallery_screen.dart';

class GalleryListScreen extends BaseRoute {
  GalleryListScreen({a, o}) : super(a: a, o: o, r: 'GalleryListScreen');
  @override
  _GalleryListScreenState createState() => _GalleryListScreenState();
}

class _GalleryListScreenState extends BaseRouteState {
  _GalleryListScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).lbl_add_gallery,
          ),
        ),
        body: Container(
            margin: const EdgeInsets.all(10),
            child: GridView.count(
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                crossAxisCount: 2,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      dialogToOpenImage(index: index);
                    },
                    child: Stack(children: [
                      SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                'assets/images/img1.jpg',
                                fit: BoxFit.cover,
                              ))),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            deleteDialog();
                          },
                          icon: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.delete,
                              size: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      )
                    ]),
                  );
                }))),
        bottomNavigationBar: Container(
            height: 45,
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddGalleryScreen()),
                  );
                },
                child: Text(
                  AppLocalizations.of(context).btn_add_new_gallery,
                ))));
  }

  dialogToOpenImage({int index}) {
    try {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return OpenImageDialog(
              a: widget.analytics,
              o: widget.observer,
              index: index,
            );
          });
    } catch (e) {
      print("Exception - base.dart - dialogToOpenImage() " + e.toString());
    }
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
                content: Text('Are your sure to delete this image?'),
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
