import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype/config/palette.dart';
import 'package:prototype/config/post.dart';
import 'package:prototype/config/user.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _InstaProfilePageState createState() => _InstaProfilePageState();
}

class _InstaProfilePageState extends State<Profile> {
  Widget _buildposts(int index) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(getRandomElement(tooltips)),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          // allows you to build a list of elements that would be scrolled away till the body reached the top
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                  color: Palette.background,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xffe43e68),
                                  const Color(0xfffaa449)
                                ],
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage(test_user.authorImageUrl),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                test_user.username,
                                style: GoogleFonts.robotoSlab(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                test_user.bio,
                                style: GoogleFonts.robotoSlab(
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      test_user.noPosts,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'posts',
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      test_user.followers,
                                      style: GoogleFonts.robotoSlab(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'followers',
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      test_user.following,
                                      style: GoogleFonts.robotoSlab(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'following',
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade700,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(
                                          Size(120, 40)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Palette.dark),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      )),
                                  onPressed: () {},
                                  child: Text('Follow',
                                      style: GoogleFonts.robotoSlab()),
                                ),
                                const Icon(
                                  Icons.send_rounded,
                                  size: 30,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ]))
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Palette.secondary,
                child: TabBar(
                  labelColor: Colors.black,
                  overlayColor: MaterialStateProperty.all(Palette.dark),
                  tabs: const [
                    Tab(text: 'Dancefakes'),
                    Tab(text: 'Templates'),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.count(
                        padding: EdgeInsets.zero,
                        crossAxisCount: 3,
                        children: [
                          for (var i = 0; i < posts.length; i++) _buildposts(i)
                        ]),
                    GridView.count(
                        padding: EdgeInsets.zero,
                        crossAxisCount: 3,
                        children: [
                          for (var i = 0; i < posts.length; i++) _buildposts(i)
                        ])
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
