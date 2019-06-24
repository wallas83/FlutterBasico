import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  int radioValue = 0;

  void handleRadioValueChanged( int value){
      setState(() {
        radioValue = value;

        print(radioValue);
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
      backgroundColor: Colors.blueGrey,
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
                    controller: null,
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
                        style: new TextStyle(color: Colors.white30),
                      ),

                      new Radio<int>(
                        activeColor: Colors.redAccent,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged),
                      new Text(
                        "mars",
                        style: new TextStyle(color: Colors.white30),
                      ),
                      new Radio<int>(
                        activeColor: Colors.yellowAccent,
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged),
                      new Text(
                        "venus",
                        style: new TextStyle(color: Colors.white30),
                      ),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.all(15.6)),
                  //result text
                  new Text(
                    "hello there",
                    style: new TextStyle(
                      color: Colors.white30,
                      fontWeight: FontWeight.w900
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
