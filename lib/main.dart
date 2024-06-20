import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double _number1;
  late double _number2;
  double _answer = 0;

  void _addition() {
    setState(() {
      _answer = _number1 + _number2;
    });
  }

  void _subtraction() {
    setState(() {
      _answer = _number1 - _number2;
    });
  }

  void _multiplication() {
    setState(() {
      _answer = _number1 * _number2;
    });
  }

  void _division() {
    setState(() {
      _answer = _number1 / _number2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _number1 = double.parse(value);
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      _number2 = double.parse(value);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('結果: $_answer'),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _addition();
                  },
                  child: const Text('+')),
              ElevatedButton(
                  onPressed: () {
                    _subtraction();
                  },
                  child: const Text('-')),
              ElevatedButton(
                  onPressed: () {
                    _multiplication();
                  },
                  child: const Text('×')),
              ElevatedButton(
                  onPressed: () {
                    _division();
                  },
                  child: const Text('÷')),
            ],
          )
        ],
      ),
    );
  }
}
