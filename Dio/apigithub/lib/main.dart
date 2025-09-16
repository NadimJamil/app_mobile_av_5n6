import 'package:dio/dio.dart';
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
  bool? isPrivate;
  String? githubUsername;
  TextEditingController usernameController = TextEditingController();
  void getHTTP(String nom) async{
    try {
      var response = await Dio().get("https://api.github.com/users/" + nom + "/repos");

      if(response.statusCode == 200){
        List<dynamic> repos = response.data;

        for(var repo in repos){
          setState(() {
            isPrivate = repo['private'];
            String githubUsername = repo['name'];
          });
        }
      }
    } catch (e) {
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
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your Github Username',
              ),
            ),
            ElevatedButton(onPressed: (){
              String username = usernameController.text;
              if (username.isNotEmpty) {
                setState(() {
                  getHTTP(username);
                });
              } else {
                setState(() {
                  isPrivate = null;
                  githubUsername = "No username entered.";
                });
              }
            }, child: Text("Appuyez pour faire une requête")),
            SizedBox(height: 32),
            Text(usernameController.text + " account is private? : $isPrivate")
          ],
        ),
      ),
    );
  }
}
