import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

// ========== State Class Starts here ==========

class _Home extends State<HomePage> {
  final _margin = 5.0;
  final TextEditingController _inputController = TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  void radioValueChanged(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _finalResult = calculate(_inputController.text, 0.38);
          _formattedText =
              "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculate(_inputController.text, 0.91);
          _formattedText =
              "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculate(_inputController.text, 2.34);
          _formattedText =
              "Your weight on Jupiter is ${_finalResult.toStringAsFixed(1)}";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Planet X',
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(_margin * 5),
        child: ListView(
          children: <Widget>[
            Image.asset(
              'images/planet.png',
              width: 150.0,
              height: 150.0,
            ),
            Container(
              alignment: Alignment.center,

              //========== Widget Tree Column Start ==========

              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      labelText: 'Your weight on Earth',
                      hintText: 'in Kgs',
                      icon: Icon(Icons.place),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(_margin * 3),
                  ),

                  //========== Widget Tree Row Start ==========
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Radio Buttons

                      Radio<int>(
                        activeColor: Colors.green,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: radioValueChanged,
                      ),

                      Text(
                        'Mars',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                      Radio<int>(
                        activeColor: Colors.blue,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: radioValueChanged,
                      ),
                      Text(
                        'Venus',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                      Radio<int>(
                        activeColor: Colors.deepOrange,
                        value: 2,
                        groupValue: radioValue,
                        onChanged: radioValueChanged,
                      ),
                      Text(
                        'Jupiter',
                        style: TextStyle(fontSize: 20.0, color: Colors.grey),
                      ),
                    ],
                  ),

                  //========== Widget Tree Row End ==========
                  Padding(
                    padding: EdgeInsets.all(_margin * 5),
                  ),
                  Text(
                    _inputController.text.isEmpty
                        ? "Plese Enter your weight to begin test"
                        : '$_formattedText'+ ' kgs',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),

              //========== Widget Tree Column End ==========
            )
          ],
        ),
      ),
    );
  }

  double calculate(String weight, double gravity) {
    if (weight.isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * gravity;
    } else
      print('wrong');

    return int.parse(weight) * 0.20;
  }
}

// ========== State Class Ends here ==========
