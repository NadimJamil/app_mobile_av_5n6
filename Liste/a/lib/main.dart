import 'package:flutter/foundation.dart';
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
  List<String> personnes = ['Bob', 'Steve', 'Frank', 'Paul', 'Robert'];
  final List<String> ordreCorrect = ['Bob', 'Frank', 'Paul', 'Robert', 'Steve'];

  void melangerListe() {
    setState(() {
      personnes.shuffle();
    });
  }

  void deplacerElement(int index, bool monter) {
    setState(() {
      if (monter && index > 0) {
        final temp = personnes[index - 1];
        personnes[index - 1] = personnes[index];
        personnes[index] = temp;
      } else if (!monter && index < personnes.length - 1) {
        final temp = personnes[index + 1];
        personnes[index + 1] = personnes[index];
        personnes[index] = temp;
      }

      if (listEquals(personnes, ordreCorrect)) {
        Future.delayed(const Duration(milliseconds: 1500), () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Félicitations!'),
            content: const Text('Vous avez remis la liste dans le bon ordre!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  melangerListe();
                },
                child: const Text('Rejouer'),
              ),
            ],
          ),
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: personnes.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: ListTile(
                leading: IconButton(
                  onPressed: index > 0
                      ? () => deplacerElement(index, true)
                      : null,
                  icon: const Icon(Icons.arrow_upward),
                ),
                title: Center(child: Text(personnes[index])),
                trailing: IconButton(
                  icon: const Icon(Icons.arrow_downward),
                  onPressed: index < personnes.length - 1
                      ? () => deplacerElement(index, false)
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
