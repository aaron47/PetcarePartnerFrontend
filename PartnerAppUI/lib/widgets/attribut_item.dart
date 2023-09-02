import 'package:flutter/material.dart';

Widget attributItem(IconData icon , String text , Color colorIcon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: colorIcon,
        size: 18,
      ),
      SizedBox(
        width: 3,
      ),
      Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
          letterSpacing: 0.8,
        ),
      ),
    ],
  );
}
