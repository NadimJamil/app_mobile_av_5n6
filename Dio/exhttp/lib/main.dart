import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int? _nombre;
  int _currentIntValue = 10;

  void requete(int nombre) async{
    try {
      var response = await Dio().get("https://fourn6-mobile-prof.onrender.com/exos/long/double/" + nombre.toString());
      print(response);
      setState(() {
        _nombre = response.data;
      });
    } catch (e) {
      setState(() {
        _nombre = null;
      });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            Text('Choisi un chiffre'),
            NumberPicker(
              value: _currentIntValue,
              minValue: 0,
              maxValue: 100,
              step: 1,
              haptics: true,
              onChanged: (value) => setState(() => _currentIntValue = value),
            ),
            SizedBox(height: 32),
            ElevatedButton(onPressed: (){
              requete(_currentIntValue);
            }, child: Text("Appuyez pour faire une requête")),
            SizedBox(height: 16),
            Text(
              'Selected Number: $_currentIntValue',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            _nombre != null
                ? Text(
              'Doubled Value: $_nombre',
              style: TextStyle(fontSize: 18, color: Colors.green),
            )
                : _nombre == null
                ? Text('No result yet or request failed.', style: TextStyle(fontSize: 18, color: Colors.red))
                : Container(),
          ],
        ),
      ),
    );
  }
}
