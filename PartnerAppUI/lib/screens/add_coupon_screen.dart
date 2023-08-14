import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';

class AddCouponScreen extends BaseRoute {
  AddCouponScreen({a, o}) : super(a: a, o: o, r: 'AddCouponScreen');
  @override
  _AddCouponScreenState createState() => _AddCouponScreenState();
}

class _AddCouponScreenState extends BaseRouteState {
  final TextEditingController _cStartDate = TextEditingController();
  final TextEditingController _cEndDate = TextEditingController();

  DateTime _startdDate;
  DateTime _endDate;
  var _fcnumber = new FocusNode();
  var _fCouponType = new FocusNode();
  var _fStartDate = FocusNode();
  var _fmaxorderamount = FocusNode();
  var _fminorderamount = FocusNode();
  var _fEndDate = FocusNode();
  String _coupontype;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).lbl_add_coupon),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
            child: Container(
              child: Column(
                children: [
                  Card(
                    child: TextFormField(
                      autofocus: true,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_fcnumber);
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).lbl_coupon_name,
                        hintText:
                            AppLocalizations.of(context).hnt_enter_coupon_name,
                      ),
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      focusNode: _fcnumber,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_fcnumber);
                      },
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context).lbl_coupon_number,
                        hintText: AppLocalizations.of(context)
                            .hnt_enter_coupon_number,
                      ),
                    ),
                  ),
                  //  Card(
                  //   margin: const EdgeInsets.all(5),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       labelText:
                  //           AppLocalizations.of(context).lbl_coupon_description,
                  //       hintText: AppLocalizations.of(context)
                  //           .lbl_enter_coupon_details_description,
                  //     ),
                  //     maxLines: 3,
                  //   ),
                  // ),

                  //select coupon type
                  Card(
                    elevation: 2,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      value: _coupontype,
                      items: [
                        'Percentage',
                        'Price',
                      ]
                          .map((label) => DropdownMenuItem(
                                child: Text(label.toString()),
                                value: label,
                              ))
                          .toList(),
                      hint: Text(
                        'Select Coupon Type',
                        style:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _coupontype = value;
                        });
                      },
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_fminorderamount);
                      },
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context).lbl_coupon_value,
                        hintText: AppLocalizations.of(context).lbl_coupon_value,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  Card(
                    child: TextFormField(
                      focusNode: _fminorderamount,
                      onEditingComplete: () {
                        FocusScope.of(context).requestFocus(_fmaxorderamount);
                      },
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).lbl_min_amount,
                        hintText: AppLocalizations.of(context).lbl_min_amount,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Card(
                    child: TextFormField(
                      focusNode: _fmaxorderamount,
                      decoration: InputDecoration(
                          labelText:
                              AppLocalizations.of(context).lbl_max_amount,
                          hintText:
                              AppLocalizations.of(context).lbl_max_amount),
                      keyboardType: TextInputType.number,
                    ),
                  ),

                  Card(
                    //margin: const EdgeInsets.all(5),
                    child: TextFormField(
                      focusNode: _fStartDate,
                      controller: _cStartDate,
                      onTap: () {
                        _selectStartDate();
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context).lbl_select_start_date,
                      ),
                    ),
                  ),
                  Card(
                    //margin: const EdgeInsets.all(5),
                    child: TextFormField(
                      focusNode: _fEndDate,
                      controller: _cEndDate,
                      onTap: () {
                        _seletEndDate();
                      },
                      decoration: InputDecoration(
                        labelText:
                            AppLocalizations.of(context).lbl_select_end_date,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        //bottomnavigation bar
        bottomNavigationBar: Container(
            // color: Colors.red,
            height: 45,
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => AddIdverificationScreen()),
                  // );
                },
                child: Text(
                  AppLocalizations.of(context).btn_save_coupon,
                ))));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  Future _selectStartDate() async {
    try {
      final DateTime picked = await showDatePicker(
        lastDate: DateTime(2022),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1940),
      );
      if (picked != null && picked != DateTime(2000)) {
        setState(() {
          _startdDate = picked;
          _cStartDate.text = formatDate(_startdDate, [yyyy, '-', mm, '-', dd]);
        });
      }
      FocusScope.of(context).requestFocus(_fStartDate);
    } catch (e) {
      print('Exception - addCoupon - _selectStartDate(): ' + e.toString());
    }
  }

  Future _seletEndDate() async {
    try {
      final DateTime picked = await showDatePicker(
        lastDate: DateTime(2022),
        context: context,
        initialDate: _startdDate,
        firstDate: _startdDate,
      );
      if (picked != null && picked != DateTime(2000)) {
        setState(() {
          _endDate = picked;
          _cEndDate.text = formatDate(_endDate, [yyyy, '-', mm, '-', dd]);
        });
      }
      FocusScope.of(context).requestFocus(_fEndDate);
    } catch (e) {
      print('Exception - addCoupon - _selectStartDate(): ' + e.toString());
    }
  }
}
