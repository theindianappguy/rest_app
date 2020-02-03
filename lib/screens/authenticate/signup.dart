import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rest_app/screens/authenticate/signin.dart';
import 'package:rest_app/services/auth_services.dart';


class SignUp extends StatefulWidget {

  final Function toogleView;
  SignUp({this.toogleView});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email, password;

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _loading ? Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ) : SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset("assets/background.png",fit: BoxFit.fill,),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(child: Image.asset("assets/logo.png",height: 30,
                        width: 30,alignment: Alignment.center,)),
                      SizedBox(height: 13,),
                      Text("RESTAPP", style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 27,color: Colors.white,
                              letterSpacing: 1
                          )
                      ),),
                      SizedBox(height: 30,),
                      Container(
                        width: 180,
                        child: Text("221 FERNANDO AVE LUCASIVALE, CA 94086", textAlign: TextAlign.center,style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white54,
                              letterSpacing: 0.6,
                              fontSize: 11
                          ),
                        ),),
                      ),
                      SizedBox(height: 40,),
                      Text("Sign Up", textAlign: TextAlign.center,style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 23,
                        ),
                      ),),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("You'r Delicios meal is Waiting 😋", textAlign: TextAlign.center,style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.white70,
                              letterSpacing: 1,
                              fontSize: 17,
                            ),
                          ),),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Form(
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 45),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                validator: (val) => val.isEmpty ? "Enter Email Id":null,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  hintText: "Email",hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15
                                ),
                                ),
                                onSaved: (val){
                                  email = val;
                                },
                              ),
                              SizedBox(height: 16,),
                              TextFormField(
                                obscureText: true,
                                validator: (val) => val.isEmpty ? "Enter Password" : null,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white)
                                  ),
                                  hintText: "Password",hintStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15
                                ),
                                ),
                                onSaved: (val){
                                  password = val;
                                },
                              ),
                              SizedBox(height: 30,),
                              GestureDetector(
                                onTap: () async {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    setState(() {
                                      _loading = true;
                                    });
                                    await _authService
                                        .signUpWithEmailAndPassword(email, password)
                                        .then((value) {
                                      if (value == null) {
                                        setState(() {
                                          _loading = false;
                                        });
                                      }
                                    });
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 0),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text("CREATE ACCOUNT",textAlign: TextAlign.center,style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          letterSpacing: 1
                                      )
                                  ),),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: (){
                          widget.toogleView();
                        },
                        child: Text("Already have an account?", style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                decoration: TextDecoration.underline,
                                letterSpacing: 0.5
                            )
                        ),),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
