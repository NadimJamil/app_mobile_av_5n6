import 'dart:math';

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
  int _indexLapin = Random().nextInt(4);
  int _pafCounter = 0;
  int _flopsCounter = 0;

  void _incrementPafs() {
    setState(() {
      _pafCounter++;
    });
  }

  void _incrementFlops() {
    setState(() {
      _flopsCounter++;
    });
  }

  void gererTape(int index){
    print(this._indexLapin);
          if(this._indexLapin == index){
            _incrementPafs();
            _indexLapin = Random().nextInt(4);
          }
          else{
            _incrementFlops();
          }
          setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(this._indexLapin);
    var b1 = MaterialButton(
      onPressed: () {
      gererTape(0);
    },
      child: Text(this._indexLapin == 0 ? 'Lapin' : "Taupe"),
    );
    var b2 = MaterialButton(onPressed: () {
      gererTape(1);
    },
      child: Text(this._indexLapin == 1 ? 'Lapin' : "Taupe"),
    );
    var b3 = MaterialButton(onPressed: () {
      gererTape(2);
    },
      child: Text(this._indexLapin == 2 ? 'Lapin' : "Taupe"),
    );
    var b4 = MaterialButton(onPressed: () {
      gererTape(3);
    },
      child: Text(this._indexLapin == 3 ? 'Lapin' : "Taupe"),
    );var b5 = MaterialButton(onPressed: () {
      gererTape(4);
    },
      child: Text(this._indexLapin == 4 ? 'Lapin' : "Taupe"),
    );
    var b6 = MaterialButton(onPressed: () {
      gererTape(5);
    },
      child: Text(this._indexLapin == 5 ? 'Lapin' : "Taupe"),
    );var b7 = MaterialButton(onPressed: () {
      gererTape(6);
    },
      child: Text(this._indexLapin == 6 ? 'Lapin' : "Taupe"),
    );
    var b8 = MaterialButton(onPressed: () {
      gererTape(7);
    },
      child: Text(this._indexLapin == 7 ? 'Lapin' : "Taupe"),
    );
    var b9 = MaterialButton(onPressed: () {
      gererTape(8);
    },
      child: Text(this._indexLapin == 8 ? 'Lapin' : "Taupe"),
    );

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                    "Pafs: " + this._pafCounter.toString(),
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
                Text(
                    "Flops: " + this._flopsCounter.toString(),
                  style: TextStyle(color: Colors.red, fontSize: 20),
                )
              ],
            ),
            Text(
                "Tape lapin",
                style: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.w900),
            ),
            Text(
              '$_flopsCounter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  b1,
                  b2,
                  b3
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b4,
                b5,
                b6
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                b7,
                b8,
                b9
              ],
            ),
          ],
        ),
      ),
    );
  }
}
