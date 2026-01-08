import 'package:flutter/material.dart';

class History {
  final _id = UniqueKey().toString();
  String _calculatedIMC = "";
  final DateTime date;

  History(this._calculatedIMC, this.date);

  String get id => _id;

  String get calculatedIMC => _calculatedIMC;

  set calculatedIMC(String calculatedIMC) {
    _calculatedIMC = calculatedIMC;
  }
}
