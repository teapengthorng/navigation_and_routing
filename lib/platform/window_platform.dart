import 'package:flutter/material.dart';

class WindowPlatform extends StatelessWidget {
   double? width; double? height;
   WindowPlatform(this.width, this.height,);
   @override
   Widget build(BuildContext context) {
   return Container(
   width: width, height: height,
   color: Colors.blue,
   child: const Center(child: Text(
   "I am Window Platform",
   style: TextStyle(fontSize: 30),)
   ),
   );
   }
}
