import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bin2dec/models/single_model.dart';

class Bin2Dec extends StatelessWidget {
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
                return new Text('${singleModel.bin}',
                  style: new TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: new Color(0xFFff5722)
                  )
                );
              },
            )),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerRight,
          child: Consumer<SingleModel>(
          //                  <--- Consumer
          builder: (context, singleModel, child) {
            return new Text('${singleModel.dec}',
              style: new TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: new Color(0xFFff5722)
              )
            );
          },
        )),
        SizedBox(height: 10),
        Expanded(
            flex: 5,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Consumer<SingleModel>(
                    //                  <--- Consumer
                    builder: (context, singleModel, child) {
                      return MaterialButton(
                        color: new Color(0xFF2196f3),
                        onPressed: () {
                          print("click");
                          singleModel.addToBin('0');
                          singleModel.binToDec();
                        },
                        child: Text("0", style: new TextStyle(fontSize: 40))
                      );
                    },
                  )),
                  SizedBox(width: 16),
                  Expanded(
                    child: Consumer<SingleModel>(
                      //                  <--- Consumer
                      builder: (context, singleModel, child) {
                        return MaterialButton(
                          color: new Color(0xFF2196f3),
                          onPressed: () {
                            print("click");
                            singleModel.addToBin('1');
                            singleModel.binToDec();
                          },
                          child: Text("1", style: new TextStyle(fontSize: 40))
                        );
                      },
                    )
                  )
                ])),
        SizedBox(height: 16),
        Expanded(
          flex: 2,
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
                child: Text("CLEAR")
              );
            },
          )
        )
      ],
    );
  }
}
