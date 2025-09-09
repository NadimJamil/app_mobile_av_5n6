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

  List<int> listeFibonnaci = [];

  int fibonnaci(int n) {
    if (n <= 1) {
      return n;
    }
    return fibonnaci(n - 1) + fibonnaci(n - 2);
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      listeFibonnaci.add(fibonnaci(i));
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
        child : ListView(
          children : listeFibonnaci.map((item){
            return Card(
              child: Padding(padding: EdgeInsets.all(8.0),
              child: Text(item.toString()),
              ),
            );
        }).toList()
        )
      //   child: ListView.builder(
      //     itemCount: listeFibonnaci.length,
      //     itemBuilder: (context, index) {
      //       return Container(
      //         margin: const EdgeInsets.all(10),
      //         padding: const EdgeInsets.all(10),
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //           borderRadius: BorderRadius.circular(10),
      //           border: Border.all(color: Colors.blue),
      //         ),
      //         child: ListTile(
      //           title: Center(
      //             child: Text(
      //               listeFibonnaci[index].toString(),
      //               style: const TextStyle(color: Colors.white, fontSize: 18),
      //             ),
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      ),
    );
  }
}