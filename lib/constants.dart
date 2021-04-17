import 'package:flutter/material.dart';

Container formField(String label, TextEditingController controller) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 2, color: Colors.black)
    ),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: label
      ),
    ),
  );
}
