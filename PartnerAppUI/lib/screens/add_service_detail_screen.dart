import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'add_service_rate_screen.dart';

class AddServiceDetailScreen extends BaseRoute {
  AddServiceDetailScreen({a, o})
      : super(a: a, o: o, r: 'AddServiceDetailScreen');
  @override
  _AddServiceDetailScreenState createState() => _AddServiceDetailScreenState();
}

class _AddServiceDetailScreenState extends BaseRouteState {
  Map<String, bool> sizeList = {
    '1-5kg': false,
    '5-10kg': false,
    '10-20kg': false,
    '20-40kg': false,
    '40+kg': false,
  };

  Map<String, bool> petsType = {
    'Cats': false,
    'Dog': false,
    'Birds': false,
    'Others': false,
  };

  final _petsnum = '1';

  String _chosePetsnumber;

  final String _valuesunpervised = 'Free roam of the house';
  String _chosenValuesupervised;
  final _valuepetsunsupervised = 'pets will never be left unattended';

  String _chosenValue;
  final _valuesleep = 'Whenever they want';
  String _chosenValuesleep;

  final _valuepottybreak = '2';
  String _chosenValuepottybreak;
  final _valuenumberofwalk = '0';

  String _chosenValuenumberofwalk;
  final _valuesizeofoutdoor = 'None';
  String _chosenValuesizeofoutdoor;

  final _value_emergencytransport = 'Yes';
  String _chosenValue_emergencytransport;
  final _valuelastminutebooking = 'Yes';

  String _chosenValuelastminuteboking;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(AppLocalizations.of(context).lbl_service_name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Column(
              children: [
                Card(
                  margin: const EdgeInsets.only(top: 15),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Borarding Name',
                      hintText: 'Enter Boarding Name',
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    // margin: const EdgeInsets.all(15),
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
                                Text(
                                  'Listing Summary',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline6,
                                ),
                                Card(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText:
                                          'Give overview of what services you offer. Tell us what a typical day looks like and some fun things pets will get to do. Description of 500 words and above will maximise your exposure.',
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
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'How many pets can you watch at your home at one time?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: _numberofpets(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'What pets do you accept?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    _petsType();
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
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Size of pets you accept?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {
                                    _petsSize();
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
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'What level of adult supervision will you provide?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: _adultunsupervised(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Where will pets be if they are left unsupervised at your home?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: _adultunsupervised(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Where will pets sleeps at night?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: _sleepatnight(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'How many potty breaks can you provide per day?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: _pottybreak(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'How many walks can you  provide per day?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: _numberofwalk(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'What best describes the home you live in?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: _hometype(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'What is the size of your outdoor area?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: _sizeofoutdoor(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Do you have transport for emergencies?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: _emergencytransport(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Do you allow last minute bookings?',
                                        style: Theme.of(context)
                                            .primaryTextTheme
                                            .headline6,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: _lastminutebooking(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Preferred search location (Optional)',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headline6,
                                ),
                                Card(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText:
                                          'Give overview of what services you offer. Tell us what a typical day looks like and some fun things pets will get to do. Description of 500 words and above will maximise your exposure.',
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddServiceRateScreen()),
                  );
                },
                child: Text(
                  AppLocalizations.of(context).btn_next,
                ))));
  }

  DropdownButtonFormField _adultunsupervised() => DropdownButtonFormField(
        items: <String>[
          'Free roam of the house',
          'Outside in my private yard',
          'Sectioned off area of the house',
          'The garaga area',
          'In separate rooms',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: const Text('Select answer'),
        onChanged: (val) {
          setState(() {
            _chosenValuesupervised = _valuesunpervised;
          });
        },
        value: _chosenValuesupervised,
        isExpanded: true,
      );

  DropdownButtonFormField _emergencytransport() => DropdownButtonFormField(
        items: <String>[
          'Yes',
          'No',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: const Text('select answer'),
        onChanged: (val) {
          setState(() {
            _chosenValue_emergencytransport = _value_emergencytransport;
          });
        },
        value: _chosenValue_emergencytransport,
        isExpanded: true,
      );

  DropdownButtonFormField _hometype() => DropdownButtonFormField(
        items: <String>[
          'Apartment/Condo',
          'Townhouse',
          'House',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: Text('select home type'),
        onChanged: (val) {
          setState(() {});
        },
        value: _chosenValue,
        isExpanded: true,
      );
  DropdownButtonFormField _lastminutebooking() => DropdownButtonFormField(
        items: <String>[
          'Yes',
          'No',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: const Text('select answer'),
        onChanged: (val) {
          setState(() {
            _chosenValuelastminuteboking = _valuelastminutebooking;
          });
        },
        value: _chosenValuelastminuteboking,
        isExpanded: true,
      );
  DropdownButtonFormField _numberofpets() => DropdownButtonFormField(
        items: <String>['1', '2', '3', '4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: const Text('select number'),
        onChanged: (val) {
          setState(() {
            _chosePetsnumber = _petsnum;
          });
        },
        value: _chosePetsnumber,
        isExpanded: true,
      );

  DropdownButtonFormField _numberofwalk() => DropdownButtonFormField(
        items: <String>[
          '0',
          '1',
          '2',
          '3+',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: const Text('select number'),
        onChanged: (val) {
          setState(() {
            _chosenValuenumberofwalk = _valuenumberofwalk;
          });
        },
        value: _chosenValuenumberofwalk,
        isExpanded: true,
      );
  Future<Map<String, bool>> _petsSize() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context, null);
                    },
                    child: Text('Cancle'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context, sizeList);
                    },
                    child: Text('Done',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                ],
                content: Container(
                  width: double.minPositive,
                  height: 270,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: sizeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      String _key = sizeList.keys.elementAt(index);
                      return CheckboxListTile(
                        activeColor: Theme.of(context).primaryColor,
                        value: sizeList[_key],
                        title: Text(_key),
                        onChanged: (val) {
                          setState(() {
                            sizeList[_key] = val;
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

  Future<Map<String, bool>> _petsType() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                // title: Text('Preferred Location'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancle'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Done',
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                ],
                content: Container(
                  width: double.minPositive,
                  height: 230,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: petsType.length,
                    itemBuilder: (BuildContext context, int index) {
                      String _key = petsType.keys.elementAt(index);
                      return CheckboxListTile(
                        activeColor: Theme.of(context).primaryColor,
                        value: petsType[_key],
                        title: Text(_key),
                        onChanged: (val) {
                          setState(() {
                            petsType[_key] = val;
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

  DropdownButtonFormField _petsunsupervised() => DropdownButtonFormField(
        items: <String>[
          'undupervised for no more than 1 hour',
          'undupervised for 1-2 hours',
          'undupervised for 2-4 hours',
          'undupervised for more than 4 hours',
          'pets will never be left unattended',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: const Text('select answer'),
        onChanged: (val) {
          setState(() {
            _chosenValue = _valuepetsunsupervised;
          });
        },
        value: _chosenValue,
        isExpanded: true,
      );
  DropdownButtonFormField _pottybreak() => DropdownButtonFormField(
        items: <String>[
          '2',
          '3-4',
          '5+',
          'Full access outside',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: const Text('select number'),
        onChanged: (val) {
          setState(() {
            _chosenValuepottybreak = _valuepottybreak;
          });
        },
        value: _chosenValuepottybreak,
        isExpanded: true,
      );
  DropdownButtonFormField _sizeofoutdoor() => DropdownButtonFormField(
        items: <String>[
          'None',
          'Small',
          'Medium',
          'Large',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: const Text('select size'),
        onChanged: (val) {
          setState(() {
            _chosenValuesizeofoutdoor = _valuesizeofoutdoor;
          });
        },
        value: _chosenValuesizeofoutdoor,
        isExpanded: true,
      );

  DropdownButtonFormField _sleepatnight() => DropdownButtonFormField(
        items: <String>[
          'Whenever they want',
          'On my bed',
          'On a dog bed',
          'In a crate',
          'Outside in my private yard',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: const Text('select answer'),
        onChanged: (val) {
          setState(() {
            _chosenValuesleep = _valuesleep;
          });
        },
        value: _chosenValuesleep,
        isExpanded: true,
      );
}
