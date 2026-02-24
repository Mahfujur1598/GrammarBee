// ================= SECTION TITLE =================

import 'package:flutter/cupertino.dart';

Widget sectionTitle(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}