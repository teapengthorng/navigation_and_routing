
import 'package:flutter/material.dart';
import 'home_page.dart';
// import 'package:flutter_login/flutter_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _fromKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController =  TextEditingController();
  bool pwd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text("Login Page"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: _fromKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
            FlutterLogo(
              style: FlutterLogoStyle.horizontal,
              textColor: Color(0xFF66BB6A),
              size: 100,),
            loginPage(),
            SizedBox(height: 15,),
            userTextfield(),
            SizedBox(height: 15,),
            passwordTextField(),
            SizedBox(height: 15,),
            buildButton()
           ], 
          ),
        ),
      ),
    );
  }

  Widget loginPage(){
    return Container(
      child: Text("Login Page", style: TextStyle( color: Colors.green[400], fontSize: 20),),
    );
  }
  Widget userTextfield(){
    return Container(
      child: TextFormField(
        style: TextStyle(height: 1, color: Colors.green[400]),
        controller:_userNameController,
        validator: (value) {
          if(value == null || value.isEmpty){
            return "Plesae Input User Name";
          }
        },
        decoration: InputDecoration(
          label: Text("UserName"),
          prefixIcon: Icon(Icons.personal_injury),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.green, width: 2),
           ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
        ),
      ),
    );
  }
 
  Widget passwordTextField(){
    return Container(
      child: TextFormField(
        style: TextStyle(color: Colors.green[400]),
        obscureText: !pwd,
        controller: _passwordController,
        validator: (value) {
          if(value == null || value.isEmpty){
            return "Please Input Passworld";
          }
        },
        decoration: InputDecoration(
          label: Text("Input Password"),
          prefixIcon: Icon(Icons.password),
          suffixIcon: IconButton(onPressed: (){
           setState(() {
              pwd = ! pwd;
           });
          }, icon: Icon(pwd ? Icons.visibility : Icons.visibility_off, color: Colors.green[400],)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
        ),
      ),
    );
  }

  Widget buildButton(){
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style:  ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green[300]),
        ) ,
        onPressed: (){
          if(_fromKey.currentState!.validate()){
            if(_userNameController.text == 'abc' && _passwordController.text == '123' ){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const HomePage())));
            } else {
              showDialog(context: context, builder: (context)=> AlertDialog(
                title: Text("Login Failed"),
                content: Text("Invalid Username or Password"),
                 actions: [
                   TextButton(onPressed: () => Navigator.pop(context), child: const Text("Ok"))
                 ]
              ) );
            }
          }
      }, child: Text("Submit")),
    );
  }
}