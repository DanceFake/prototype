import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype/config/palette.dart';
import 'package:prototype/screens/profile/profile_builder.dart';

class PageTransition extends StatefulWidget {
  PageTransition({Key? key}) : super(key: key);

  @override
  _PageTransitionState createState() => _PageTransitionState();
}

class _PageTransitionState extends State<PageTransition> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff040708),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/animation.gif'),
              SizedBox(height: 10),
              DefaultTextStyle(
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoSlab(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Palette.dark,
                  shadows: [
                    const Shadow(
                      blurRadius: 5.0,
                      color: Colors.black,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Text("Brewing magic"),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Palette.dark,
                  semanticsLabel: 'Linear progress indicator',
                ),
              )
            ],
          )),
    );
  }
}
