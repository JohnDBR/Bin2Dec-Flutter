import 'package:flutter/material.dart';

class Bin2Dec extends StatefulWidget {
  Bin2Dec({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Bin2DecState createState() => _Bin2DecState();
}

class _Bin2DecState extends State<Bin2Dec> {
  String _bin = "0";
  String _dec = "0";

  void _addToBin(String anotherBin) {
    setState(() {
      if (_bin == '0') {
        _bin = '$anotherBin';
      } else {
        _bin = '$_bin$anotherBin';
      }
    });
  }

  void _binToDec() {
    setState(() {
      _dec = '${int.parse(_bin, radix: 2).toRadixString(10)}';
    });
  }

  void _clear() {
    setState(() {
      _bin = '0';
      _dec = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            alignment: Alignment.centerRight,
            child: new Text('$_bin',
                style: new TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: new Color(0xFFff5722)))),
        SizedBox(height: 10),
        Container(
            alignment: Alignment.centerRight,
            child: new Text('$_dec',
                style: new TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: new Color(0xFFff5722)))),
        SizedBox(height: 10),
        Expanded(
            flex: 5,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      child: MaterialButton(
                          color: new Color(0xFF2196f3),
                          onPressed: () {
                            print("click");
                            _addToBin('0');
                            _binToDec();
                          },
                          child:
                              Text("0", style: new TextStyle(fontSize: 40)))),
                  SizedBox(width: 16),
                  Expanded(
                      child: MaterialButton(
                          color: new Color(0xFF2196f3),
                          onPressed: () {
                            print("click");
                            _addToBin('1');
                            _binToDec();
                          },
                          child: Text("1", style: new TextStyle(fontSize: 40))))
                ])),
        SizedBox(height: 16),
        Expanded(
            flex: 2,
            child: MaterialButton(
                color: new Color(0xFF0069c0),
                textColor: Colors.white,
                onPressed: () {
                  print("click");
                  _clear();
                },
                child: Text("CLEAR")))
      ],
    );
  }
}
