import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';

import '../widgets/drawer_widget.dart';
import 'add_blog_screen.dart';
import 'blog_detail_screen.dart';

class BlogListScreen extends BaseRoute {
  BlogListScreen({a, o}) : super(a: a, o: o, r: 'BlogListScreen');
  @override
  _BlogListScreenState createState() => _BlogListScreenState();
}

class _BlogListScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context).lbl_blogs,
        ),
        actions: [
          Container(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.plus),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddBlogScreen()),
                    );
                  }))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext ctx, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlogDetailScreen()),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(5),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.asset(
                                            'assets/images/img1.jpg',
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ),
                                  // Container(
                                  //   child: Text('Public'),
                                  // )
                                ],
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            visualDensity: const VisualDensity(
                                                horizontal: 0, vertical: -4),
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            title:
                                                Text('Hello this is good news'),
                                            subtitle: Row(
                                              children: [
                                                Text('7 hours ago'),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            BlogDetailScreen()),
                                                  );
                                                },
                                                child: RichText(
                                                    text: TextSpan(
                                                        text:
                                                            'In Publishing and graphics design,Lorem ipsum is a placehoder textLorem ipsum is a placeholder. ',
                                                        style: Theme.of(context)
                                                            .primaryTextTheme
                                                            .bodyText2,
                                                        children: const [
                                                      TextSpan(
                                                        text: 'readmore..',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff3d4ed9)),
                                                      )
                                                    ])),
                                              ))
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
