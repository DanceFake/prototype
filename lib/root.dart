import 'package:google_fonts/google_fonts.dart';
import 'package:prototype/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/templates/templates.dart';
import 'package:prototype/screens/profile/profile_builder.dart';
import 'config/palette.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _State();
}

class _State extends State<Root> with SingleTickerProviderStateMixin {
  String title = 'Home';
  String prevTitle = 'Profile';
  String nextTitle = 'Templates';
  double offset = 0.0;

  final PageController _pageController = PageController();
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat();

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.0, 0.0),
  ).animate(_controller);

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        offset = _pageController.offset;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.purple,
          title: Stack(
            children: <Widget>[
              // Expanded(
              //     child: Center(
              //         child: SlideTransition(
              //             position: _offsetAnimation,
              //             child: Text(
              //               prevTitle,
              //               style: const TextStyle(fontSize: 15),
              //             )))),
              AnimatedPositioned(
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: Container(
                    child: Center(
                  child: Text(
                    title,
                    style: GoogleFonts.robotoSlab(),
                  ),
                )),
              )
              // Expanded(
              //     child: Center(
              //         child: SlideTransition(
              //             position: _offsetAnimation,
              //             child: Text(
              //               nextTitle,
              //               style: const TextStyle(fontSize: 15),
              //             )))),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (int x) {
          setState(() {
            offset = _pageController.offset;
            _controller.animateTo(offset);
          });
          switch (x) {
            case 0:
              setState(() {
                title = 'Home';
                prevTitle = 'Profile';
                nextTitle = 'Templates';
              });
              break;
            case 1:
              setState(() {
                title = 'Templates';
                prevTitle = 'Home';
                nextTitle = 'Profile';
              });
              break;
            case 2:
              setState(() {
                title = 'Profile';
                prevTitle = 'Templates';
                nextTitle = 'Home';
              });
              break;

            default:
          }
        },
        children: <Widget>[
          FeedScreen(),
          SearchPage(),
          const Profile(),
        ],
      ),
    );
  }
}
