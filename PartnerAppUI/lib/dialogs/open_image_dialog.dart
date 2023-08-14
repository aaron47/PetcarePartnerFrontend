import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/base.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OpenImageDialog extends Base {
  final Uint8List image;

  final int index;
  final String name;

  OpenImageDialog({a, o, this.image, this.index, this.name})
      : super(analytics: a, observer: o);
  @override
  OpenImageDialogState createState() =>
      OpenImageDialogState(this.image, this.index, this.name);
}

class OpenImageDialogState extends BaseState {
  final Uint8List image;

  int index;
  String name;
  OpenImageDialogState(this.image, this.index, this.name) : super();
  int currentIndex = 0;
  PageController pageController;
  @override
  void initState() {
    super.initState();
    if (index != null) {
      pageController = PageController(initialPage: index);
      currentIndex = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context).lbl_add_gallery,
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
          child: index != null
              ? PhotoViewGallery.builder(
                  customSize: Size(300, 300),
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: AssetImage('assets/images/img1.jpg'),
                      initialScale: PhotoViewComputedScale.contained * 0.8,
                    );
                  },
                  itemCount: 3,
                  loadingBuilder: (context, event) => Center(
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        strokeWidth: 2,
                        value: event == null
                            ? 0
                            : event.cumulativeBytesLoaded /
                                event.expectedTotalBytes,
                      ),
                    ),
                  ),
                  backgroundDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  pageController: pageController,
                  // onPageChanged: (index) {
                  //   setState(() {
                  //     currentIndex = index;
                  //   });
                  // },
                )
              : PhotoView(
                  backgroundDecoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  imageProvider: MemoryImage(image),
                )),
    );
  }
}
