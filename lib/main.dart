import 'package:flutter/material.dart';
import '3. Send data to a new screen/home_page.dart';
import '4. Return data from a screen/home_page.dart';
import 'login_page.dart';
import 'page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoginPage(),
    );
  }
}
