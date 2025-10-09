import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:formatif/transfer.dart';

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
  TextEditingController continentController = TextEditingController();
  TextEditingController familleController = TextEditingController();
  List<Animal> list = [];
  bool isLoading = false;
  String errorMessage = '';
  void requete() async {
    String continent = continentController.text.trim().isEmpty ? "monde" : continentController.text.trim();
    String famille = familleController.text.trim();

    String url = "http://10.0.2.2:8080/exam/animaux/$continent";
    if(famille.isNotEmpty){
      url += "?famille=$famille";
    }

    setState(() {
      isLoading = true;
      errorMessage = "";
    });

    try {
      var requete = await Dio().get(url);
      print(requete);
      if (requete.statusCode == 200) {
        List<dynamic> data = requete.data;
        setState(() {
          list = data.map((json) => Animal.fromJson(json)).toList();
        });
      } else {
        setState(() {
          list = [];
          errorMessage = "Erreur serveur: ${requete.statusCode}";
        });
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    continentController.dispose();
    familleController.dispose();
    super.dispose();
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
            SizedBox(
              height: 50,
              child: TextFormField(
                controller: continentController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Enter continent",
                ),
              ),
            ),
            TextFormField(
              controller: familleController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "Enter continent",
              ),
            ),
            ElevatedButton(onPressed: () => requete(), child: Text("Envoyer requête")),
            if (isLoading)
              CircularProgressIndicator()
            else if (errorMessage.isNotEmpty)
              Text(errorMessage, style: TextStyle(color: Colors.red))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final animal = list[index];
                    return ListTile(
                      leading: animal.continent.toLowerCase() == "océans"
                          ? Icon(Icons.water)
                          : Icon(Icons.landscape),
                      title: Text(animal.nom),
                      subtitle: Text(
                        "${animal.espece} — Famille: ${animal.famille} — Continent: ${animal.continent}",
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
