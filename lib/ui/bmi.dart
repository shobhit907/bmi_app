import 'package:flutter/material.dart';

class BMI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMIState();
  }
}

class BMIState extends State<BMI> {
  TextEditingController _age = new TextEditingController();
  TextEditingController _height = new TextEditingController();
  TextEditingController _weight = new TextEditingController();
  var result1 = "";
  var result2 = "";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "BMI",
          style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        padding: EdgeInsets.only(top: 15.0),
        alignment: Alignment.center,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              "images/bmilogo.png",
              width: 100,
              height: 100,
            ),
            new Container(
              color: Colors.grey.shade200,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextField(
                      controller: _age,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: "Enter your age",
                        labelStyle: Theme
                            .of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.blue),
                        hintStyle: Theme
                            .of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.grey),
                        hintText: "in years",
                        focusedBorder: new OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextField(
                      controller: _height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.insert_chart),
                        labelText: "Enter your height",
                        labelStyle: Theme
                            .of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.blue),
                        hintStyle: Theme
                            .of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.grey),
                        hintText: "in centimetres",
                        focusedBorder: new OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextField(
                      controller: _weight,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: Icon(Icons.line_weight),
                        labelText: "Enter your weight",
                        labelStyle: Theme
                            .of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.blue),
                        hintStyle: Theme
                            .of(context)
                            .textTheme
                            .title
                            .copyWith(color: Colors.grey),
                        hintText: "in kg",
                        focusedBorder: new OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new RaisedButton(
                      onPressed: _calculate,
                      color: Colors.pinkAccent,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "Calculate",
                          style: new TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.all(8.0)),
            new Container(
              child: new Column(
                children: <Widget>[
                  new Text(
                    result1,
                    style: new TextStyle(
                      color: Colors.blue.shade600,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      result2,
                      style: new TextStyle(
                        color: Colors.pink,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0.0),
              child: new Container(
                alignment: Alignment.bottomCenter,
                child: new Text("©2019 by Shobhit Gupta",style: new TextStyle(color: Colors.black,
                    fontSize: 25,fontWeight: FontWeight.w500),),
              ),
            )
          ],
        ),
      ),
    );
  }

  double _calculate() {
    setState(() {
      FocusScope.of(context).requestFocus(new FocusNode());
      if (double
          .parse(_age.text)
          .toString()
          .isNotEmpty &&
          double.parse(_age.text) > 0 &&
          double
              .parse(_height.text)
              .toString()
              .isNotEmpty &&
          double.parse(_height.text) > 0 &&
          double
              .parse(_weight.text)
              .toString()
              .isNotEmpty &&
          double.parse(_weight.text) > 0) {
        double _bmi = double.parse(_calculateBMI(
            double.parse(_weight.text), double.parse(_height.text))
            .toStringAsFixed(1));
        result1 = "Your BMI : ${_bmi.toStringAsFixed(1)}";
        if (_bmi < 18.5) {
          result2 = "Underweight";
        } else if (_bmi >= 18.5 && _bmi <= 24.9) {
          result2 = "Normal";
        } else if (_bmi >= 25 && _bmi <= 29.9) {
          result2 = "Overweight";
        } else {
          result2 = "Obese";
        }
      }
      else
        {
          result1="";
          result2="";
        }
    });
  }

  double _calculateBMI(double weight, double height) {
    double hm = height / 100;
    return weight / (hm * hm);
  }
}
