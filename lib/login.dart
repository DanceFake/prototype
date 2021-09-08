import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype/config/palette.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:prototype/root.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget button(String text,
      {double height = 40,
      double width = 130,
      Color backgroundColor = Palette.dark,
      Color textColor = Colors.black,
      isGoogle = false,
      isEmail = false}) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        )),
        minimumSize: MaterialStateProperty.all(Size(width, height)),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
      ),
      child: Text(
        text,
        style: GoogleFonts.robotoSlab(
          fontSize: 20,
          color: textColor,
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Root()));
      },
    );
  }

  Widget _textField(String initialText, String label, IconData icon) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      child: TextFormField(
        initialValue: initialText,
        decoration: InputDecoration(
          labelStyle: GoogleFonts.robotoSlab(color: Colors.black),
          labelText: label,
          //errorText: errorText,
          border: OutlineInputBorder(),
          suffixIcon: Icon(
            icon,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;
    return Scaffold(
        backgroundColor: Palette.background,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 95),
                  child: Center(
                    child: Hero(
                      tag: 'dancefake',
                      child: Text(
                        "DanceFake",
                        style: GoogleFonts.robotoSlab(
                          fontSize: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text("Your AI Dance Assistant",
                        style: GoogleFonts.robotoSlab(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: const Color(0xff000000),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                          spreadRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width * 0.82,
                    height: MediaQuery.of(context).size.height * 0.44,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.82,
                          height: MediaQuery.of(context).size.height * 0.44,
                          decoration: BoxDecoration(
                            color: Palette.secondary,
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                color: Color(0xff000000),
                                blurRadius: 5.0,
                                spreadRadius: 0,
                                offset: Offset(2.0, 0.0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              const SizedBox(height: 10),
                              Expanded(
                                child: Text("Login to DanceFake",
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 27,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ),
                              _textField('', 'Username', Icons.person),
                              const SizedBox(height: 10),
                              _textField('', 'Password', Icons.password),
                              const SizedBox(height: 10),
                              button('Login', height: 40, width: 240),
                              const SizedBox(height: 10),
                              Text("or continue with",
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  button('Google',
                                      backgroundColor: const Color(0xFFFFFFFF),
                                      textColor: Color.fromRGBO(0, 0, 0, 1.0),
                                      isGoogle: true),
                                  button('Email',
                                      backgroundColor: const Color(0xFF4285F4),
                                      isEmail: true),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
