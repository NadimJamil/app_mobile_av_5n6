import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Demo'),
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
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                    child: Container(
                  width: 150,
                  height: 200,
                  color: Colors.red,
                )),
                Expanded(
                  flex: 1,
                    child: Container(
                  child: Text("Yo", style: TextStyle(color: Colors.red, fontSize: 24),),
                )),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black,
                      height: 100,
                    ))
              ],
            ),
            Expanded(flex: 1, child:
            Row(
                children: []
            ),
            ),
            Expanded(flex: 1, child:
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(flex: 1 ,child:
                  Container(
                    color: Colors.blue,
                    child: TextButton(onPressed: () {}, child: const Text("Button du bas", style: TextStyle(color: Colors.white),)),
                  ),
                  ),
                  // TextButton(onPressed: () {}, child: const Text("Boutton du bas", style: TextStyle(color: Colors.white),))
                ]
            ),
            )
          ],
        ),
      ),
    );
  }
}
