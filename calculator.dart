import 'package:flutter/material.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<SimpleCalculator> {
  Color textcolor = Colors.white;
  String texte = '';
  Color Bcolor = Colors.grey[350]!;
  String _output = '0';
  String prev = '';
  String curentOP = '';
  bool isbuttonpressed = false;

  void _bulildpreesed(String value) {
    setState(() {
      if (value == 'AC') {
        _output = '0';
        prev = '';
        curentOP = '';
        isbuttonpressed = false;
      } else if (value == "+" || value == '-' || value == "/" || value == "x") {
        prev = _output;
        curentOP = value;
        isbuttonpressed = true;
      } else if (value == '=') {
        Calculating();
      } else if (value == "+/-") {
        if (_output != "0") {
          _output = _output.startsWith('-') ? _output.substring(1) : '-$_output';
        }
      } else if (value == '%') {
        double num = double.tryParse(_output) ?? 0;
        _output = (num / 100).toString();
      } else {
        if (_output == '0' || isbuttonpressed) {
          _output = value;
          isbuttonpressed = false;
        } else {
          _output += value;
        }
      }
    });
  }

  void Calculating() {
    double _prev = double.tryParse(prev) ?? 0;
    double _curent = double.tryParse(_output) ?? 0;
    double result = 0;
    switch (curentOP) {
      case "+":
        result = _prev + _curent;
        break;
      case "-":
        result = _prev - _curent;
        break;
      case "/":
        result = _prev / _curent;
        break;
      case "x":
        result = _prev * _curent;
        break;
    }
    _output = result.toString();
    curentOP = "";
    isbuttonpressed = false;
    prev = '';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _output, // Dynamically display the output
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bulildBottons(Colors.grey[350]!, "AC", Colors.black),
                _bulildBottons(Colors.grey[350]!, "+/-", Colors.black),
                _bulildBottons(Colors.grey[350]!, "%", Colors.black),
                _bulildBottons(Colors.amber[800]!, "/", Colors.black),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bulildBottons(Colors.grey[350]!, "7", Colors.black),
                _bulildBottons(Colors.grey[350]!, "8", Colors.black),
                _bulildBottons(Colors.grey[350]!, "9", Colors.black),
                _bulildBottons(Colors.amber[800]!, "+", Colors.black),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bulildBottons(Colors.grey[350]!, "4", Colors.black),
                _bulildBottons(Colors.grey[350]!, "5", Colors.black),
                _bulildBottons(Colors.grey[350]!, "6", Colors.black),
                _bulildBottons(Colors.amber[800]!, "-", Colors.black),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _bulildBottons(Colors.grey[350]!, "1", Colors.black),
                _bulildBottons(Colors.grey[350]!, "2", Colors.black),
                _bulildBottons(Colors.grey[350]!, "3", Colors.black),
                _bulildBottons(Colors.amber[800]!, "x", Colors.black),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.fromLTRB(35, 12, 128, 12),
                  ),
                  onPressed: () => _bulildpreesed("0"),
                  child: const Text(
                    "0",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _bulildBottons(Colors.grey[800]!, ".", Colors.white),
                _bulildBottons(Colors.amber[800]!, "=", Colors.white), // Fixed to "="
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bulildBottons(Color Bcolor, String text, Color textcolor) {
    return GestureDetector(
      onTap: () => _bulildpreesed(text),
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Bcolor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textcolor,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        ),
      ),
    );
  }
}
