import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';

class ChatScreen extends BaseRoute {
  ChatScreen({a, o}) : super(a: a, o: o, r: 'ChatScreen');
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseRouteState {
  _ChatScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Navigator.of(context).pop();
          return null;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Jenil',
            ),
            elevation: 0,
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                  child: ListView(
                    reverse: true,
                    physics: BouncingScrollPhysics(),
                    children: _listViewWidget(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 8, right: 8),
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Type Something',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Padding(
                        padding: EdgeInsets.only(left: 2),
                        child: IconButton(
                          color: Theme.of(context).primaryColor,
                          icon: Icon(
                            FontAwesomeIcons.camera,
                            size: 18,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        size: 21,
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                    contentPadding: const EdgeInsets.only(top: 5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _listViewWidget() {
    List<Widget> _widgetList = [];
    try {
      for (int index = 0; index < 4; index++) {
        _widgetList.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        margin: const EdgeInsets.all(7),
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 08, bottom: 08),
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            margin: const EdgeInsets.all(5),
                            child: Text(
                              'Hello Sara,Thank you for your message, We will drop them at 8:45 on 15th ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ))),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('5:30pm', style: TextStyle(fontSize: 10)),
                    )
                  ],
                ),
              ],
            ),
          ],
        ));
        _widgetList.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFDDDFF5),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.all(7),
                        padding: EdgeInsets.only(
                            left: 12, right: 12, top: 08, bottom: 08),
                        child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            margin: EdgeInsets.all(5),
                            child: Text(
                              'Hey, Mellisa looking forword to having Fluffy and Cookie with us!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        '11:00 AM',
                        style: TextStyle(fontSize: 10),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ));
      }

      return _widgetList;
    } catch (e) {
      print("Exception - chatScreen.dart - _listViewWidget():" + e.toString());
      _widgetList.add(SizedBox());
      return _widgetList;
    }
  }
}
