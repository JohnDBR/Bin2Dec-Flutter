import 'package:flutter/material.dart';

class SingleModel extends ChangeNotifier {
  String bin = "0";
  String dec = "0";
  SingleModel({this.bin, this.dec});

  void addToBin(String anotherBin) {
    if (bin == '0') {
      bin = '$anotherBin';
    } else {
      bin = '$bin$anotherBin';
    }
    notifyListeners();
  }

  void binToDec() {
    dec = '${int.parse(bin, radix: 2).toRadixString(10)}';
    notifyListeners();
  }

  void addToDec(String anotherDec) {
    if (dec == '0') {
      dec = '$anotherDec';
    } else {
      dec = '$dec$anotherDec';
    }
    notifyListeners();
  }

  void decToBin() {
    bin = '${int.parse(dec, radix: 10).toRadixString(2)}';
    notifyListeners();
  }

  void clear() {
    bin = '0';
    dec = '0';
    notifyListeners();
  }
}