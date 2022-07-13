import 'package:flutter/material.dart';

class TabletPlatform extends StatelessWidget {
   double? width; double? height;
   TabletPlatform(this.width, this.height,);
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
