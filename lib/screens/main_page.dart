import 'package:bin2dec/widgets/dec2bin.dart';
import 'package:flutter/material.dart';
import 'package:bin2dec/widgets/bin2dec.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _bin2dec = true;

  void _changeLayout() {
    setState(() {
      _bin2dec = !_bin2dec;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bin2Dec',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: new AppBar(
              title: _bin2dec ? Text('Bin2Dec') : Text('Dec2Bin'),
            ),
            body: Center(
                child: Container(
                    margin: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          // Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: <Widget>[
                          //       new Text('Binario -> Decimal')
                          //     ]),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: FlatButton(
                                  onPressed: () {
                                    _changeLayout();
                                  },
                                  child: Text('Binario -> Decimal'))),
                          Expanded(
                              child: _bin2dec
                                  ? Bin2Dec()
                                  : Dec2Bin())
                        ])))));
  }
}
