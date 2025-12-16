import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'HttpJason.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        useMaterial3: true,
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
  final String matricule = "2261561";
  final FirebaseFirestore db = FirebaseFirestore.instance;
  String nom = "";
  String prenom = "";

  Future<void> obtenirInfos() async {
    final doc = await db
        .collection('etudiants')
        .doc(matricule)
        .get();

    if (doc.exists) {
      final data = doc.data()!;
      setState(() {
        nom = data['nom'];
        prenom = data['prenom'];
      });
    }
  }

  Future<void> mettreAJour() async {
    await db
        .collection('etudiants')
        .doc(matricule)
        .update({'complete': true});
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
        children: [
          ElevatedButton(
            onPressed: () => obtenirInfos(),
            child: const Text("Obtenir"),
          ),

          ElevatedButton(
            onPressed: () => mettreAJour(),
            child: const Text("Mettre à jour"),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Division()),
              );
            },
            child: const Text("Aller à Division"),
          ),

          const SizedBox(height: 20),

          Text("Nom : $nom", style: const TextStyle(fontSize: 18)),
          Text("Prénom : $prenom", style: const TextStyle(fontSize: 18)),
        ],
      ),
      ),
    );
  }
}
