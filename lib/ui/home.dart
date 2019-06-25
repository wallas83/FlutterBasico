import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  /*
 * Venus: 0.91
 * Earth: 1.00
 * Pluto: 0.06
 * Mars: 0.38
 */

  final TextEditingController _weightController = new TextEditingController();

  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedTExt = "";

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattedTExt = "your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.36);
          _formattedTExt = "your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattedTExt = "your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("weight on Planet x"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your Weight on Earth',
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radio buttons
                      new Radio<int>(
                          activeColor: Colors.brown,
                          value: 0,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "pluto",
                        style: new TextStyle(color: Colors.black54),
                      ),

                      new Radio<int>(
                          activeColor: Colors.redAccent,
                          value: 1,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "mars",
                        style: new TextStyle(color: Colors.black54),
                      ),
                      new Radio<int>(
                          activeColor: Colors.yellowAccent,
                          value: 2,
                          groupValue: radioValue,
                          onChanged: handleRadioValueChanged),
                      new Text(
                        "venus",
                        style: new TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.6)),
                  //result text
                  new Text(
                      _weightController.text.isEmpty ? "Please enter weight" : "$_formattedTExt lbs",
                    //" $_formattedTExt lbs",
                    style: new TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.w900),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    } else {
      print("wrong");
      return int.parse("180") * 0.38;
    }
  }
}
