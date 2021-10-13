import 'package:flutter/material.dart';

const yMargin5 = SizedBox(height: 5.0);
const yMargin10 = SizedBox(height: 10.0);
const yMargin15 = SizedBox(height: 15.0);
const yMargin20 = SizedBox(height: 20.0);
const yMargin25 = SizedBox(height: 25.0);
const yMargin30 = SizedBox(height: 30.0);
const yMargin40 = SizedBox(height: 40.0);
const yMargin50 = SizedBox(height: 50.0);
const yMargin60 = SizedBox(height: 60.0);
const yMargin100 = SizedBox(height: 100.0);
const yMargin200 = SizedBox(height: 200.0);

const xMargin5 = SizedBox(width: 5.0);
const xMargin10 = SizedBox(width: 10.0);
const xMargin20 = SizedBox(width: 20.0);
const xMargin25 = SizedBox(width: 25.0);

const xMargin30 = SizedBox(width: 30.0);
const xMargin40 = SizedBox(width: 40.0);
const xMargin50 = SizedBox(width: 50.0);
const xMargin60 = SizedBox(width: 60.0);
const xMargin70 = SizedBox(width: 70.0);
const xMargin200 = SizedBox(width: 200.0);

Widget customYMargin(double y) {
  return SizedBox(
    height: y,
  );
}

Widget customXMargin(double x) {
  return SizedBox(
    width: x,
  );
}
