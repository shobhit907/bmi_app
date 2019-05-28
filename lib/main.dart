import 'package:flutter/material.dart';
import './ui/bmi.dart';
void main()
{
  runApp(
    new MaterialApp(
      title: "BMI",
      debugShowCheckedModeBanner: false,
      home: new BMI(),
    )
  );
}