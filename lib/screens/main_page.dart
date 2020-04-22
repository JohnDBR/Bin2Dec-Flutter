import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bin2dec/models/single_model.dart';
import 'package:bin2dec/widgets/bin2dec.dart';
import 'package:bin2dec/widgets/dec2bin.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SingleModel>(
      //      <--- ChangeNotifierProvider
      create: (context) => SingleModel(bin : '0', dec: '0'),
      child: _buildUi()
    );
  }

  Widget _buildUi() {
    return MaterialApp(
        title: 'Bin2Dec',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: new AppBar(
              title: Consumer<SingleModel>(
                //                  <--- Consumer
                builder: (context, singleModel, child) {
                  return singleModel.bin2dec ? Text('Bin2Dec') : Text('Dec2Bin');
                },
              ),
            ),
            body: Center(
                child: Container(
                    margin: const EdgeInsets.all(16),
                    alignment: Alignment.center,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Consumer<SingleModel>(
                                  //                  <--- Consumer
                                  builder: (context, singleModel, child) {
                                    return FlatButton(
                                      onPressed: () {
                                        singleModel.changeLayout();
                                        // singleModel.clear(); It's impresive without cleaning!
                                      },
                                      child: Text('Binario -> Decimal')
                                    );
                                  },
                                )),
                          Expanded(
                              child: Consumer<SingleModel>(
                                //                  <--- Consumer
                                builder: (context, singleModel, child) {
                                  return singleModel.bin2dec
                                  ? Bin2Dec(singleModel: singleModel)
                                  : Dec2Bin(singleModel: singleModel);
                                },
                              ))
                        ])))));
  }
}
