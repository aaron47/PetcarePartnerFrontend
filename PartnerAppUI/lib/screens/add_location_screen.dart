import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/businessLayer/baseRoute.dart';

class AddLocationScreen extends BaseRoute {
  AddLocationScreen({a, o}) : super(a: a, o: o, r: 'AddLocationScreen');
  @override
  _AddLocationScreenState createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends BaseRouteState {
  _AddLocationScreenState() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
