import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rest_app/services/auth_services.dart';

class SignIn extends StatefulWidget {
  final VoidCallback toggleView;

  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  /// For Fingerprint & FaceId Local Auth
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  String _authorizedOrNot = 'Not Authorized';
  bool _canCheckBiometric = false;

  bool _loading = false;
  String? error;

  Future<void> checkBiometrics() async {
    bool canCheckBiometric = false;
    try {
      canCheckBiometric = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }

    if (!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _authorizeNow() async {
    bool isAuthorized = false;
    try {
      isAuthorized = await _localAuthentication.authenticate(
        localizedReason: 'Please authenticate to complete your transaction',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    }

    if (!mounted) return;

    setState(() {
      if (isAuthorized) {
        _authorizedOrNot = 'Authorized';
      } else {
        _authorizedOrNot = 'Not Authorized';
      }
    });
  }

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
                          'Sign In',
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
                                          ? 'Enter Valid Email'
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
                                          .signInWithEmailAndPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          error =
                                              'Please supply a valid email';
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
                                      'SUBMIT',
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
                        const Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () async {
                            await checkBiometrics();
                            if (_canCheckBiometric) {
                              await _authorizeNow();
                              if (_authorizedOrNot == 'Authorized') {
                                _authService.signInAnom();
                              } else {
                                if (context.mounted) {
                                  cantCheckBiometricsDialog(context);
                                }
                              }
                            } else {
                              if (context.mounted) {
                                cantCheckBiometricsDialog(context);
                              }
                            }
                          },
                          child: Image.asset(
                            'assets/fingerprint.png',
                            height: 36,
                            width: 36,
                          ),
                        ),
                        const SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            widget.toggleView();
                          },
                          child: Text(
                            "Don't have an account?",
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

Future<void> cantCheckBiometricsDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('No Biometrics Found'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Can not login with Biometrics'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
