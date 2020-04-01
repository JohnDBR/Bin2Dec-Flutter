import 'package:flutter/material.dart';
import 'package:bin2dec/widgets/bin2dec.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bin2Dec',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Bin2Dec(title: 'Bin2Dec'),
    );
  }
}
