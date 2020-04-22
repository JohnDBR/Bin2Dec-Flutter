import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bin2dec/models/single_model.dart';

class Dec2Bin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SingleModel>(
      //      <--- ChangeNotifierProvider
      create: (context) => SingleModel(bin : '0', dec: '0'),
      child: _buildUi()
    );
  }

  Widget _buildUi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            alignment: Alignment.centerRight,
            child: Consumer<SingleModel>(
              //                  <--- Consumer
              builder: (context, singleModel, child) {
                return new Text('${singleModel.dec}',
                  style: new TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: new Color(0xFFff5722))
                );
              },
            )
          ),
        SizedBox(height: 10),
        Container(
            alignment: Alignment.centerRight,
            child: Consumer<SingleModel>(
              //                  <--- Consumer
              builder: (context, singleModel, child) {
                return new Text('${singleModel.bin}',
                  style: new TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: new Color(0xFFff5722))
                );
              },
            )
          ),
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
              child: Consumer<SingleModel>(
                //                  <--- Consumer
                builder: (context, singleModel, child) {
                  return MaterialButton(
                  color: new Color(0xFF0069c0),
                  textColor: Colors.white,
                  onPressed: () {
                    print("click");
                    singleModel.clear();
                  },
                  child: Text("CLEAR"));
                },
              ))
        ])
      ],
    );
  }

  Widget numberButton(int number) {
    return Consumer<SingleModel>(
      //                  <--- Consumer
      builder: (context, singleModel, child) {
        return Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                color: new Color(0xFF2196f3),
                onPressed: () {
                  print("click");
                  singleModel.addToDec('$number');
                  singleModel.decToBin();
                },
                child:
                    Text(number.toString(), style: new TextStyle(fontSize: 26.0))),
          ),
        );
      },
    );
  }
}
