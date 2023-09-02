import 'dart:convert';
import 'package:flutter/material.dart';

String createServiceRequestToJson(CreateServiceRequest data) =>
    json.encode(data.toJson());

class CreateServiceRequest {
  final String userEmail;
  final String serviceName;
  final String imageLink;
  final String title;
  final int price;
  final String description;
  final int duration;

  CreateServiceRequest({
    @required this.userEmail,
    @required this.serviceName,
    @required this.imageLink,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.duration,
  });

  Map<String, dynamic> toJson() => {
         "serviceName": serviceName,
        "imageLink": imageLink,
        "title": title,
        "price": price,
        "duration": duration,
        "description": description,
        "userEmail": userEmail,
      };
}
