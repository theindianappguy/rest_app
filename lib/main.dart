import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_app/models/dart.dart';
import 'package:rest_app/screens/home.dart';
import 'package:rest_app/screens/authenticate/signin.dart';
import 'package:rest_app/screens/authenticate/signup.dart';
import 'package:rest_app/screens/wrapper.dart';
import 'package:rest_app/services/auth_services.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/signin' : (BuildContext context) => new SignIn(),
          '/signup' : (BuildContext context) => new SignUp(),
          '/home' : (BuildContext context) => new Home(),
        },
      ),
    );
  }
}
