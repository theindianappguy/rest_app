import 'package:flutter/material.dart';
import 'package:rest_app/screens/home.dart';
import 'package:rest_app/screens/signin.dart';
import 'package:rest_app/screens/signup.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signin' : (BuildContext context) => new SignIn(),
        '/signup' : (BuildContext context) => new SignUp(),
        '/home' : (BuildContext context) => new Home(),
      },
    );
  }
}
