import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DivisionPage(),
    );
  }
}

class DivisionPage extends StatefulWidget {
  @override
  State<DivisionPage> createState() => _DivisionPageState();
}

class _DivisionPageState extends State<DivisionPage> {
  // Contrôleurs pour les 2 champs de texte
  TextEditingController dividendeController = TextEditingController();
  TextEditingController diviseurController = TextEditingController();

  // Fonction appelée quand on clique sur le bouton
  void calculer() async {
    // 1. Récupérer les valeurs des champs
    String dividende = dividendeController.text;
    String diviseur = diviseurController.text;

    // 2. Construire l'URL avec les valeurs
    String url = 'https://examen-final-a24.azurewebsites.net/Exam2024/Division/$dividende/$diviseur';

    try {
      // 3. Envoyer la requête GET au serveur
      var response = await http.get(Uri.parse(url));

      // 4. Vérifier le code de réponse
      if (response.statusCode == 200) {
        // SUCCÈS (1 point) - Extraire le résultat du JSON
        var data = jsonDecode(response.body);
        int resultat = data['resultat'];

        // Afficher le résultat dans un SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Résultat : $resultat'),
            backgroundColor: Colors.green,
          ),
        );
      }
      else if (response.statusCode == 400) {
        // ERREUR 400 (1 point) - Division par zéro
        // Afficher le message d'erreur du serveur
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.body),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // ERREUR DE COMMUNICATION (1 point) - Pas de connexion au serveur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Impossible de communiquer avec le serveur. Vérifiez votre connexion internet.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Division'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CHAMP 1 : Dividende
            TextField(
              controller: dividendeController,
              decoration: InputDecoration(
                labelText: 'Dividende',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),

            // CHAMP 2 : Diviseur
            TextField(
              controller: diviseurController,
              decoration: InputDecoration(
                labelText: 'Diviseur',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),

            // BOUTON : Calculer (1 point - envoie la requête GET)
            ElevatedButton(
              onPressed: calculer,
              child: Text('Calculer'),
            ),
          ],
        ),
      ),
    );
  }
}