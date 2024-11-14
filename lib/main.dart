import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BMIHomePage(),
    );
  }
}

class BMIHomePage extends StatefulWidget {
  @override
  _BMIHomePageState createState() => _BMIHomePageState();
}

class _BMIHomePageState extends State<BMIHomePage> {
  double _height = 170; // cm
  double _weight = 60; // kg
  double _bmi = 0;

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildSlider('Height (cm)', _height, 100, 220, (newValue) {
              setState(() => _height = newValue);
            }),
            SizedBox(height: 20),
            _buildSlider('Weight (kg)', _weight, 30, 150, (newValue) {
              setState(() => _weight = newValue);
            }),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Colors.teal,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Your BMI is ${_bmi.toStringAsFixed(1)}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _bmi < 18.5
                    ? Colors.blue
                    : _bmi < 24.9
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max,
      Function(double) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ${value.toStringAsFixed(1)}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: (max - min).toInt(),
          label: value.toStringAsFixed(1),
          onChanged: onChanged,
          activeColor: Colors.teal,
        ),
      ],
    );
  }
}