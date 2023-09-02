import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pet_patner_demo/models/pet.dart';
import 'package:pet_patner_demo/models/service_model.dart';
import 'package:pet_patner_demo/models/user.dart';

Reservation reservationFromJson(String str) =>
    Reservation.fromJson(json.decode(str));

class Reservation {
  // final String id;
  // final String sitterId;
  // final String petId;
  // final String serviceId;
  // final String createdAt;
  // final String status;
  // final String duration;
  // final String budget;
  final String id;
  final String sitterId;
  final String petId;
  final String serviceId;
  final String type;
  final String dateDeb;
  final String dateFin;
  final String status;
  final int prixTotal;
  final User user;
  final ServiceModel service;
  final Pet pet;

  Reservation(
      {@required this.id,
      @required this.sitterId,
      @required this.petId,
      @required this.serviceId,
      @required this.type,
      @required this.dateDeb,
      @required this.dateFin,
      @required this.status,
      @required this.prixTotal,
      this.user,
      this.service,
      this.pet});

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        id: json["_id"],
        sitterId: json['sitterId'],
        petId: json['petId'],
        serviceId: json['serviceId'],
        type: json['type'],
        dateDeb: json['dateDeb'],
        dateFin: json['dateFin'],
        status: json['status'],
        prixTotal: json['prixTotal'],
        user: json['user'] != null ? new User.fromJson(json['user']) : null,
        service: json['service'] != null
            ? new ServiceModel.fromJson(json['service'])
            : null,
        pet: json['pet'] != null ? new Pet.fromJson(json['pet']) : null,
      );
}
