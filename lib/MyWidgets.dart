import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RoundedButton extends StatefulWidget {
  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  var color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 250.0,
      height: 50,
      margin: EdgeInsets.only(top: 30),
      color: Colors.transparent,
      child: OutlineButton(
          child: Text(
            "TEST",
            style: TextStyle(color: color, fontSize: 18.0),
          ),
          color: color,
          highlightColor: color,
          disabledBorderColor: color,
          splashColor: color,
          disabledTextColor: color,
          highlightedBorderColor: Colors.green,
          textColor: color,
          onPressed: () {
            print("Button Clicked");
            setState(() {
              if (color == Colors.red) {
                color = Colors.blue;
              } else {
                color = Colors.red;
              }
            });
          },
          shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          )),
    );
  }
}

class BlynkButton extends StatefulWidget {
  @override
  _BlynkButtonState createState() => _BlynkButtonState();
}

class _BlynkButtonState extends State<BlynkButton> {
  var color = Colors.greenAccent;
  final String url =
      // "http://163.172.160.156:8080/76b963d12ad74db6a6d2e338a48cab6f/project";
      "https://api.particle.io/v1/devices/3a0027001947373239323130/digitalwrite";
  final String url_btn =
      "http://163.172.160.156:8080/76b963d12ad74db6a6d2e338a48cab6f/update/V1?value=";
  var data;
  @override
  void initState() {
    super.initState();
    //this.getJsonData(url,);
  }

  Future<String> getJsonData(url_call, state) async {
    var response = await http.post(Uri.encodeFull(url_call), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer 8275f6339f89da2ef79166868db028091ea95b6c"
    }, body: {
      "arg": "D7 $state"
    }
        // body: {"access_token":"8275f6339f89da2ef79166868db028091ea95b6c"}
        );
    print(response.body);
    var convertToJson = json.decode(response.body);
    print("");
    //data = convertToJson['widgets'];
    // print(data[0]['pin']);
  }

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: data == null ? 0 : data.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     print(data[index]['type']);
    //     return Container(
    //       child: Column(
    //         children: <Widget>[
    //           Card(
    //             child: Container(
    //               child: Text(data[index]['type']),
    //               padding: EdgeInsets.all(20.0),
    //             ),
    //           )
    //         ],
    //       ),
    //     );
    //   },
    // );
    return Container(
      color: Colors.transparent,
      width: 300,
      height: 60,
      margin: EdgeInsets.only(top: 15.0),
      child: FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        onPressed: () {
          setState(() {
            if (color == Colors.greenAccent) {
              getJsonData(url, "HIGH");
              print('True');
              color = Colors.blueAccent;
            } else {
              getJsonData(url, "LOW");
              print('False');
              color = Colors.greenAccent;
            }
          });
        },
        color: color,
        child: Text(
          "text",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Raleway',
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}

class RoundedFlatButton extends StatefulWidget {
  @override
  _RoundedFlatButtonState createState() => _RoundedFlatButtonState();
}

class _RoundedFlatButtonState extends State<RoundedFlatButton> {
  var color = Colors.transparent;
  var color_text = Colors.greenAccent;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        setState(() {
          if (color == Colors.transparent) {
            color = Colors.greenAccent;
            color_text = Colors.blueAccent;
          } else {
            color_text = Colors.blueAccent;
            color = Colors.transparent;
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width / 2,
        padding: EdgeInsets.all(25.0),
        height: 75,
        child: Text(
          "V1",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20.0, color: color_text),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
          border: new Border.all(
            width: 1.0,
            color: Colors.greenAccent,
          ),
        ),
      ),
    );
  }
}

//LED Widget Similar to Blynk
class LEDWidget extends StatefulWidget {
  @override
  _LEDWidgetState createState() => _LEDWidgetState();
}

class _LEDWidgetState extends State<LEDWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          color: Colors.greenAccent, borderRadius: BorderRadius.circular(25.0)),
    );
  }
}

class ParticleButton extends StatefulWidget {
  String pinNo;
  ParticleButton({@required this.pinNo});
  @override
  _ParticleButtonState createState() => _ParticleButtonState();
}

class _ParticleButtonState extends State<ParticleButton> {
  Timer timer;

  var _color = Colors.transparent;
  var _ledColor = Colors.red[400];
  final String url =
      "https://api.particle.io/v1/devices/3a0027001947373239323130/digitalwrite";
  var data;
  @override
  void initState() {
    super.initState();

    //this.getJsonData(url,);
  }

  Future<String> getJsonData(url_call, pin, state) async {
    if (timer == null) {
      timer = Timer.periodic(Duration(milliseconds: 500), (Timer timer) {
        setState(() {
          print(timer.tick);
          _ledColor == Colors.orange[400]
              ? _ledColor = Colors.blueGrey
              : _ledColor = Colors.orange[400];
        });
      });
    } else {
      timer.cancel();
      timer = Timer.periodic(Duration(milliseconds: 500), (Timer timer) {
        setState(() {
          print(timer.tick);
          _ledColor == Colors.orange[400]
              ? _ledColor = Colors.blueGrey
              : _ledColor = Colors.orange[400];
        });
      });
    }

    var response = await http.post(Uri.encodeFull(url_call), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer 8275f6339f89da2ef79166868db028091ea95b6c"
    }, body: {
      "arg": "$pin $state"
    }
        // body: {"access_token":"8275f6339f89da2ef79166868db028091ea95b6c"}
        );
    print(response.body);
    var convertToJson = json.decode(response.body);
    print("");
    data = convertToJson['return_value'];
    print(data);

    setState(() {
      data.toString() == "1"
          ? _ledColor = Colors.greenAccent
          : _ledColor = Colors.redAccent;
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: InkWell(
            borderRadius: BorderRadius.circular(50.0),
            child: Container(
              child: Center(
                child: Text(
                  widget.pinNo,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              width: 300.0,
              height: 80.0,
              decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(50.0),
                  border: new Border.all(
                    width: 1.5,
                    color: Colors.greenAccent,
                  )),
            ),
            onTap: () {
              setState(() {
                if (_color == Colors.transparent) {
                  getJsonData(url, widget.pinNo, "HIGH");
                  _color = Colors.greenAccent;
                  print("HIGH");
                } else {
                  getJsonData(url, widget.pinNo, "LOW");
                  _color = Colors.transparent;
                  print("LOW");
                }
              });
            },
          ),
        ),
        Container(
          //LED Widget
          width: 25,
          height: 25,
          margin: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
              color: _ledColor, borderRadius: BorderRadius.circular(25.0)),
        )
      ],
    );
  }
}

class BatteryWidget extends StatefulWidget {
  int percentage;
  BatteryWidget({@required this.percentage});
  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Stack(
              children: <Widget>[
                Container(
                  child: Container(
                    color: Colors.greenAccent,
                    margin: EdgeInsets.only(right: 100.0-widget.percentage),
                  ),
                  margin: EdgeInsets.only(top: 20),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4.0),
                      borderRadius: BorderRadius.circular(2.0)),
                ),
                Center(
                    child: Container(
                  margin: EdgeInsets.only(top: 35, left: 30),
                  child: Text(
                    widget.percentage.toString()+"%",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )),
              ],
            )),
            Container(
              margin: EdgeInsets.only(top: 24),
              width: 12,
              height: 20,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 4.0),
                    right: BorderSide(width: 4.0),
                    top: BorderSide(width: 4.0)),
                // borderRadius: BorderRadius.circular(2.0)
              ),
            )
          ],
        ),
        // Container(
        //       child: Center(
        //         child: Text(
        //           "75%",
        //           textAlign: TextAlign.center,
        //           style: TextStyle(fontWeight: FontWeight.bold),
        //         ),
        //       ),
        //       margin: EdgeInsets.only(top: 24,left: 144),
        //       width: 75,
        //       height: 42,
        //       decoration: BoxDecoration(
        //           color: Colors.greenAccent,
        //       ),
        //     ),
      ],
    );
  }
}
