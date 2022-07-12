import 'package:flutter/material.dart';

class LinuxPlatform extends StatelessWidget {
   double? width; double? height;
   LinuxPlatform(this.width, this.height,);
   @override
   Widget build(BuildContext context) {
   return Container(
   width: width, height: height,
   color: Colors.deepPurple,
   child: const Center(child: Text(
   "I am Linux Platform",
   style: TextStyle(fontSize: 30),)
   ),
   );
   }
}
