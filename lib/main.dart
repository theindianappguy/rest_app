import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_app/models/dart.dart';
import 'package:rest_app/screens/home.dart';
import 'package:rest_app/screens/authenticate/signin.dart';
import 'package:rest_app/screens/authenticate/signup.dart';
import 'package:rest_app/screens/wrapper.dart';
import 'package:rest_app/services/auth_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: const Wrapper(),
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/signin': (BuildContext context) => SignIn(toggleView: () {}),
          '/signup': (BuildContext context) => SignUp(toggleView: () {}),
          '/home': (BuildContext context) => const Home(),
        },
      ),
    );
  }
}
