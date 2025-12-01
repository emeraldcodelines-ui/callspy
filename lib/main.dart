import 'package:flutter/material.dart';

void main() {
  runApp(const CallSpyApp());
}

class CallSpyApp extends StatelessWidget {
  const CallSpyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CallSpy',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CallSpy'),
        ),
        body: const Center(
          child: Text('Welcome to CallSpy!'),
        ),
      ),
    );
  }
}
