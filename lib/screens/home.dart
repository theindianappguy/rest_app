import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_app/services/auth_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(
          'RESTAPP',
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(fontSize: 18, letterSpacing: 1),
          ),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
        actions: const <Widget>[],
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Hello World'),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff465EFB),
                    ),
                    onPressed: () async {
                      setState(() {
                        _loading = true;
                      });
                      await _authService.signOut();
                      setState(() {
                        _loading = false;
                      });
                    },
                    child: const Text('Log Out'),
                  ),
                ],
              ),
            ),
    );
  }
}
