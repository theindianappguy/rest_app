import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_app/models/dart.dart';
import 'package:rest_app/screens/authenticate/authenticate.dart';
import 'package:rest_app/screens/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser?>(context);

    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
