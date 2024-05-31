import 'package:calculator/calc_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CalcUI(),
    theme: ThemeData(primaryColor: Colors.white, canvasColor: Colors.black),
  ));
}
