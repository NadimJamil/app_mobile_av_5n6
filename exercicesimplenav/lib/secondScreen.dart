import 'package:exercicesimplenav/main.dart';
import 'package:flutter/material.dart';

class secondScreen extends StatefulWidget {

  final String text;

  const secondScreen({Key? key, required this.text}) : super(key: key);

  @override
  State<secondScreen> createState() => _secondScreenState();
}


class _secondScreenState extends State<secondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (context) => MyHomePage(title: "Cool je reviens de la 2e page"),
                  ),
                );
              },
              child: Text("${widget.text}"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Je pop"),
            ),
          ],
        ),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Second Page'),
//     ),
//     body: Center(
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.pop(context);
//         },
//         child: const Text('Go Back'),
//       ),
//     ),
//   );
// }