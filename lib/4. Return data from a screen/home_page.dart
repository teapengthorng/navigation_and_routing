// import 'package:flutter/material.dart';

// import 'second_page.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           child: const Text("Go to SecondPage"),
//           onPressed: () async{
//           final result = await  Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondPage() ));
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content : Text(result)));
//           }, 
//         ),
//       ),
//     );
//   }
// }