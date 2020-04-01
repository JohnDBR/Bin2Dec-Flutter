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
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Bin2Dec'),
        ),
        body: Center(
            child: Container(
          margin: const EdgeInsets.all(16),
          alignment: Alignment.center,
          // color: Color.blue,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(mainAxisSize: MainAxisSize.max,
                  // alignment: Alignment.topLeft,
                  children: <Widget>[new Text('Binario -> Decimal')]),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text('$_bin',
                        style: new TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: new Color(0xFFff5722)))
                  ]),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new Text('$_dec',
                        style: new TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: new Color(0xFFff5722)))
                  ]),
              SizedBox(height: 10),
              Expanded(
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
                    SizedBox(width: 25), // give it width
                    Expanded(
                        child: MaterialButton(
                            color: new Color(0xFF2196f3),
                            onPressed: () {
                              print("click");
                              _addToBin('1');
                              _binToDec();
                            },
                            child:
                                Text("1", style: new TextStyle(fontSize: 40))))
                  ])),
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
          ),
        )));
  }
}
