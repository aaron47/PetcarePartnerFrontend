import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/models/businessLayer/global.dart' as global;

class BlogDetailScreen extends BaseRoute {
  BlogDetailScreen({a, o}) : super(a: a, o: o, r: 'BlogDetailScreen');
  @override
  _BlogDetailScreenState createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends BaseRouteState {
  //list of blogs images
  var images = [
    'assets/images/img1.jpg',
    'assets/images/pets1.jpg',
    'assets/images/img1.jpg',
    'assets/images/pets1.jpg'
  ];
  bool _like = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).lbl_blog_details,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      child: imageSlider(context),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      bottom: 12,
                      child: Row(
                        children: [
                          Padding(
                            padding: global.isRTL
                                ? const EdgeInsets.only(left: 15)
                                : const EdgeInsets.only(right: 5),
                            child: CircleAvatar(
                                radius: 20,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                    'assets/images/userprofile.jpg',
                                  ),
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: Text(
                              'Jenil Patel',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          )
                        ],
                      )),
                  Positioned(
                      right: 30,
                      bottom: 10,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() => _like = !_like);
                              },
                              child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: _like
                                      ? Image.asset(
                                          "assets/images/unlike.png",
                                        )
                                      : Image.asset(
                                          "assets/images/like.png",
                                        ))),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '10',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ))
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Hello this is good news ',
                        style: Theme.of(context).textTheme.headline4,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'In Publishing and graphics design, Lorem ipsum is a placehoder textLorem ipsum is a placeholder text,Mention if you have any other experience in training,grooming, or have magic hands with pets :) as well as any certification you have acquired.Mention if you have any other experience in training,grooming, or have magic hands with pets :) as well as any certification you have acquired.Mention if you have any other experience in training,grooming, or have magic hands with pets :) as well as any certification you have acquired.',
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//image slider for blogs images
  Swiper imageSlider(context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Stack(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          )
        ]);
      },
      itemCount: images.length,
      scale: 0.9,
    );
  }
}
