import 'package:exercicelistenav/personPage.dart';
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
      home: const MyHomePage(title: 'Liste'),
    );
  }
}

class Personne{
  final int id;
  final String name;
  Personne({required this.id, required this.name});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Personne> personnes = [
    Personne(id: 1, name: 'Alice'),
    Personne(id: 2, name: 'Bob'),
    Personne(id: 3, name: 'Charlie'),
    Personne(id: 4, name: 'Diana'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: personnes.map((person) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  backgroundColor: Colors.deepPurple.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => personPage(personne: person),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          person.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('ID: ${person.id}'),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        )

      ),
    );
  }
}
