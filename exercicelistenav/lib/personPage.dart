import 'package:exercicelistenav/main.dart';
import 'package:flutter/material.dart';

class personPage extends StatefulWidget {
  final Personne personne;
  const personPage({Key? key, required this.personne}) : super(key: key);

  @override
  State<personPage> createState() => _personPage();
}

class _personPage extends State<personPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail personne'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: ${widget.personne.id}', style: TextStyle(fontSize: 20)),
            Text('Name: ${widget.personne.name}', style: TextStyle(fontSize: 24)),
          ],
      ),
      ),
    );
  }
}