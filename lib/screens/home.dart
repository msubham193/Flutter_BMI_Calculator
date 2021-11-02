import 'package:bmi/constant/app_constant.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHexColor,
      appBar: AppBar(
        title: Text("BMI Calculator",
            style:
                TextStyle(color: accentHexColor, fontWeight: FontWeight.w300)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8))),
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You\'re over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have normal weight";
                  } else {
                    _textResult = "You\'re under weight";
                  }
                });
              },
              child: Container(
                child: Text("Calculate",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor)),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor)),
            ),
            SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: accentHexColor)),
              ),
            ),
            SizedBox(height: 30),
            LeftBar(barWidth: 40),
            SizedBox(height: 20),
            LeftBar(barWidth: 70),
            SizedBox(height: 20),
            LeftBar(barWidth: 40),
            SizedBox(height: 10),
            RightBar(barWidth: 40),
            SizedBox(height: 20),
            RightBar(barWidth: 70),
            SizedBox(height: 20),
            RightBar(barWidth: 40),
          ],
        ),
      ),
    );
  }
}
