import 'package:flutter/material.dart';

class DefaultPlatForm extends StatefulWidget {
  @override
  _DefaultPlatFormState createState() => _DefaultPlatFormState();
}

class _DefaultPlatFormState extends State<DefaultPlatForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.redAccent,
     child: const Center(
     child: Text(
    "I am Alain Platform",
     style: TextStyle(fontSize: 30),
     )
     ),
     );
     }
}

