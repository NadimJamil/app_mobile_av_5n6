import 'package:flutter/material.dart';
import 'package:formatif/page2.dart';

class LeTiroir extends StatefulWidget {
  const LeTiroir({super.key});

  @override
  State<LeTiroir> createState() => _LeTiroirState();
}

class _LeTiroirState extends State<LeTiroir> {
  @override
  Widget build(BuildContext context) {
    var list = ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child: Text("Mon super tiroir \n " + "Nadim Jamil \n " + "2261561"),
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.abc),
          title: const Text("Page Detail"),
          onTap: (){
            Navigator.of(context).pop();
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PageDetail(),
                ),
            );
          },
        )
      ],
    );
    return Drawer(
      child: Container(
        color: Color(0xFFFFFFFF),
        child: list,
      ),
    );
  }
}
