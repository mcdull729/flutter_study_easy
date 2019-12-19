import 'package:flutter/material.dart';

pd(Widget w, {double l, double t, double r, double b}) {
  return Padding(
    padding: EdgeInsets.fromLTRB(l, t, r, b),
    child: w,
  );
}

pda(Widget w, {double a}) {
  return Padding(
    padding: EdgeInsets.all(a),
    child: w,
  );
}

pdlr(Widget w, {double ver, double hor}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: ver, horizontal: hor),
    child: w,
  );
}

var textTips = TextStyle(fontSize: 20.0, color: Colors.black);
var hintTips = TextStyle(fontSize: 18.0, color: Colors.black26);
