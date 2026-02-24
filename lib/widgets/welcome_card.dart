// ================= WELCOME CARD =================

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget welcomeCard() {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome, Student!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text("Let’s learn something new today."),
        ],
      ),
    ),
  );
}