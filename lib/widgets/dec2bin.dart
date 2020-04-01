import 'package:flutter/material.dart';

class Dec2Bin extends StatefulWidget {
  Dec2Bin({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Dec2BinState createState() => _Dec2BinState();
}

class _Dec2BinState extends State<Dec2Bin> {
  String _bin = "0";
  String _dec = "0";

  void _addToDec(String anotherDec) {
    setState(() {
      if (_dec == '0') {
        _dec = '$anotherDec';
      } else {
        _dec = '$_dec$anotherDec';
      }
    });
  }

  void _decToBin() {
    setState(() {
      _bin = '${int.parse(_dec, radix: 10).toRadixString(2)}';
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
            child: new Text('$_dec',
                style: new TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: new Color(0xFFff5722)))),
        SizedBox(height: 10),
        Container(
            alignment: Alignment.centerRight,
            child: new Text('$_bin',
                style: new TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: new Color(0xFFff5722)))),
        SizedBox(height: 10),
        Expanded(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              numberButton(1),
              numberButton(2),
              numberButton(3)
            ])),
        Expanded(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              numberButton(4),
              numberButton(5),
              numberButton(6)
            ])),
        Expanded(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
              numberButton(7),
              numberButton(8),
              numberButton(9)
            ])),
        Expanded(
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[numberButton(0)])),
        SizedBox(height: 16),
        Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Expanded(
              child: MaterialButton(
                  color: new Color(0xFF0069c0),
                  textColor: Colors.white,
                  onPressed: () {
                    print("click");
                    _clear();
                  },
                  child: Text("CLEAR")))
        ])
      ],
    );
  }

  Widget numberButton(int number) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
            color: new Color(0xFF2196f3),
            onPressed: () {
              print("click");
              _addToDec('$number');
              _decToBin();
            },
            child:
                Text(number.toString(), style: new TextStyle(fontSize: 26.0))),
      ),
    );
  }
}
