import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_app/services/auth_services.dart';

class SignUp extends StatefulWidget {
  final VoidCallback toggleView;

  const SignUp({super.key, required this.toggleView});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        'assets/background.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            'assets/logo.png',
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                          ),
                        ),
                        const SizedBox(height: 13),
                        Text(
                          'RESTAPP',
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 27,
                              color: Colors.white,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 180,
                          child: Text(
                            '221 FERNANDO AVE LUCASIVALE, CA 94086',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Colors.white54,
                                letterSpacing: 0.6,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: 23,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "You'r Delicious meal is Waiting",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  color: Colors.white70,
                                  letterSpacing: 1,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: _formKey,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 45,
                            ),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  validator: (val) =>
                                      (val == null || val.isEmpty)
                                          ? 'Enter Email Id'
                                          : null,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                    ),
                                  ),
                                  onSaved: (val) {
                                    email = val ?? '';
                                  },
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  obscureText: true,
                                  validator: (val) =>
                                      (val == null || val.isEmpty)
                                          ? 'Enter Password'
                                          : null,
                                  decoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                    ),
                                  ),
                                  onSaved: (val) {
                                    password = val ?? '';
                                  },
                                ),
                                const SizedBox(height: 30),
                                GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      setState(() {
                                        _loading = true;
                                      });
                                      final result = await _authService
                                          .signUpWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          _loading = false;
                                        });
                                      }
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(50),
                                    ),
                                    child: Text(
                                      'CREATE ACCOUNT',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Text(
                            'Already have an account?',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
