import 'package:flutter/material.dart';
import 'MyWidgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Harplyn Irrigation",
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Harplyn Controller"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          //child: BlynkButton(),
          child: Column(
            children: <Widget>[

              BatteryWidget(
                percentage: 75,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
              ),
              ParticleButton(
                pinNo: "D7",
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
              ),
              ParticleButton(
                pinNo: "D4",
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
              ),
              ParticleButton(
                pinNo: "D5",
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
              ),
              ParticleButton(
                pinNo: "D6",
              ),
              // new Image.asset('pictures/battery.png')

              //       ],
              //     )
            ],
          ),
        ));
  }
}
