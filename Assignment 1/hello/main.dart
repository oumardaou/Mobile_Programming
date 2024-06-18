import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  printHello(); // Calling the function to print "Hello"
}

void printHello() {
  print('Hello');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed:
              printHello, // Calling the function when the button is pressed
          child: const Text('Press me'),
        ),
      ),
    );
  }
}
