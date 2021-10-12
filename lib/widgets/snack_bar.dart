import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customSnackBar(context, text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w800),
      ),
    ),
  );
}
