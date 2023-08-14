import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:pet_patner_demo/screens/add_service_detail_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutmeScreen extends BaseRoute {
  AboutmeScreen({a, o}) : super(a: a, o: o, r: 'AboutmeScreen');
  @override
  _AboutmeScreenState createState() => _AboutmeScreenState();
}

class _AboutmeScreenState extends BaseRouteState {
  @override
  Widget build(BuildContext context) {
    Map<String, bool> _skils = {
      'Experince in training': false,
      'Behavioral modifications': false,
      'Able to recognise subtitle signs of a problem': false,
      'Skils to administer medication': false,
      'Some veterinary experince': false,
      'Basic understanding of how to manage and care for pets': false,
      'Grooming certificate': false,
    };
    Future<Map<String, bool>> _showDialogskills() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  actions: <Widget>[
                    Container(
                        height: 38,
                        margin: const EdgeInsets.all(10),
                        width: 100,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => AddIdverificationScreen()),
                              // );
                            },
                            child: const Text(
                              "Cancle",
                            ))),
                    Container(
                        height: 38,
                        margin: const EdgeInsets.all(10),
                        width: 100,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => AddIdverificationScreen()),
                              // );
                            },
                            child: const Text(
                              "Done",
                            ))),
                  ],
                  content: SizedBox(
                    width: double.minPositive,
                    height: 300,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _skils.length,
                      itemBuilder: (BuildContext context, int index) {
                        String _key = _skils.keys.elementAt(index);
                        return CheckboxListTile(
                          activeColor: Theme.of(context).primaryColor,
                          value: _skils[_key],
                          title: Text(_key),
                          onChanged: (val) {
                            setState(() {
                              _skils[_key] = val;
                            });
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).lbl_about_me),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Container(
                    //margin: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Introduce yourself and why you enjoy being with pets',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    ),
                                  ],
                                ),
                                Card(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText:
                                          "e.g. i'm a pet lover and I love love pets as they are absolutely adorable.  ",
                                    ),
                                    maxLines: 5,
                                  ),
                                )
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'If You have a pet tell us about the type of pet you have and your experince with it',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    ),
                                  ],
                                ),
                                Card(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText:
                                          "e.g. I own a German shepard since i was 18, its a wonderful pet and takes care of me and my family. I walk and sleep with her daily.",
                                    ),
                                    maxLines: 5,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'How does your service stand out?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    ),
                                  ],
                                ),
                                Card(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText:
                                          "Tell potential customer why they should choose you above others.",
                                    ),
                                    maxLines: 5,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'What do you enjoy about the work you do?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    ),
                                  ],
                                ),
                                Card(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      hintText:
                                          "Describe what makes you enjoy what you do.",
                                    ),
                                    maxLines: 5,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //checkbox list in alert dialog
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Your skill and qualifications',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    _showDialogskills();
                                  },
                                  child: Column(
                                    children: const [
                                      ListTile(
                                        trailing: Icon(Icons.arrow_drop_down),
                                      ),
                                      Divider(
                                        height: 1,
                                        thickness: 1.0,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //lastquestion
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Other special skills with pet or qualifications?',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline6,
                                ),
                                Card(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText:
                                          'Mention if you have any other experience in training,grooming, or have magic hands with pets :) as well as any certification you have acquired. ',
                                    ),
                                    maxLines: 5,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                //main column
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
                    MaterialPageRoute(
                        builder: (context) => AddServiceDetailScreen()),
                  );
                },
                child: Text(
                  AppLocalizations.of(context).btn_next,
                ))));
  }
}
