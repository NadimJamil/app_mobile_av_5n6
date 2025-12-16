import 'package:flutter/material.dart';

import 'main.dart';

class PageDetail extends StatefulWidget {
  const PageDetail({super.key});

  @override
  State<PageDetail> createState() => _State();
}

class _State extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Text("Page Detail"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: Container(
                color: Colors.orange,
              ),
            ),
            OutlinedButton(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyApp(),
                  ),
              );
            }, child: Text("Revenir à l'accueil"))
          ],
        ),
      );
  }
}
