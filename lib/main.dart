import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'nirbhay',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text("Your BMI")),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("BMI",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
              ),
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Center(child: Text('Enter Your Weight')),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Center(child: Text('Enter Your Height in feets')),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 18,
              ),
              TextField(
                controller: inchController,
                decoration: InputDecoration(
                  label: Center(child: Text('Enter Your Height in Inches')),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inchController.text.toString();
                    if (wt != "" && ft != '' && inch != '') {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var Iinch = int.parse(inch);

                      var tinch = (ift * 12) + Iinch;
                      var tcm = tinch * 2.54;
                      var tm = tcm / 100;
                      var bmi = iwt / (tm * tm);
                      setState(() {
                        result = 'Your bmi is $bmi';
                      });
                    } else {
                      setState(() {
                        result = 'Please fill all the required blank';
                      });
                    }
                  },
                  child: Text('Calculate')),
              Text(
                result,
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
