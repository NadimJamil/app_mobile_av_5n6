import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  final Dio dio = Dio();
  final ImagePicker picker = ImagePicker();

  String imagePath = "";
  List<String> imageUrls = [];

  Future<void> selectionnerImage() async {
    final List<XFile> images = await picker.pickMultiImage();
    if (images.isEmpty) return;

    setState(() {
      imageUrls.clear();
      print("Images sélectionnées : ${images.length}");
    });

    try {
      for (XFile image in images) {
        String filename = image.name;
        FormData formData = FormData.fromMap({
          "file": await MultipartFile.fromFile(image.path, filename: filename),
        });

        Response response = await dio.post(
            "http://10.0.2.2:8080/exos/file",
            data: formData
        );

        if (response.statusCode == 200) {
          String id = response.data.toString();
          String imageUrl = "http://10.0.2.2:8080/exos/file/$id?width=200";
          imageUrls.add(imageUrl);
          setState(() {

          });
        }
      }
    } on Exception catch (e) {
      print("Erreur $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => selectionnerImage(),
              child: Text("Selectionner image"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: imageUrls.isEmpty
                  ? const Center(child: Text("Aucune image à afficher"))
                  : ListView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(imageUrls[index]),
                  );
                },
              ),
            ),
          ],
        ),
      );
  }
}
