import 'package:flutter/material.dart';

class secondScreen extends StatefulWidget {

  final String text;

  const secondScreen({Key? key, required this.text}) : super(key: key);

  @override
  _secondScreenState createState() => _secondScreenState();
}


class _secondScreenState extends State<secondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('$text'),
        ),
      ),
    );
  }
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Second Page'),
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Go Back'),
      ),
    ),
  );
}