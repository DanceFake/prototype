import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prototype/config/category.dart';
import 'package:prototype/config/comment.dart';
import 'package:prototype/config/multi_manager/flick_multi_manager.dart';
import 'package:prototype/config/multi_manager/flick_multi_player.dart';
import 'package:prototype/config/palette.dart';
import 'package:prototype/config/post.dart';
import 'package:prototype/screens/templates/template_item.dart';
import 'package:flutter/painting.dart';
import 'package:prototype/helpers/image_picker.dart';
import 'package:image_picker/image_picker.dart';
import './page_transition.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final imageService = new ImagePickerService();
  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildComment(int index) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListTile(
        leading: Container(
          width: 50.0,
          height: 50.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: CircleAvatar(
            child: ClipOval(
              child: Image(
                height: 50.0,
                width: 50.0,
                image: AssetImage(comments[index].authorImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          comments[index].authorName,
          style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(comments[index].text),
        trailing: IconButton(
          icon: Icon(
            Icons.favorite_border,
          ),
          color: Colors.grey,
          onPressed: () => print('Like comment'),
        ),
      ),
    );
  }

  Widget _buildTemplate(Post post, String _image) {
    return makeDismissible(
        child: DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (_, scrollController) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          color: Colors.purple.shade800,
        ),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              width: double.infinity,
              height: 500.0,
              decoration: BoxDecoration(
                color: Palette.background,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[],
                        ),
                        InkWell(
                          onDoubleTap: () => print('Like post'),
                          child: Container(
                              margin: const EdgeInsets.all(10),
                              width: double.infinity,
                              height: 400.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                // boxShadow: const [
                                //   BoxShadow(
                                //     color: Colors.black45,
                                //     offset: Offset(0, 5),
                                //     blurRadius: 8.0,
                                //   ),
                                // ],
                              ),
                              child: _buildVideo(post, _image)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(Icons.favorite_border),
                                        iconSize: 30.0,
                                        onPressed: () => print('Like post'),
                                      ),
                                      Text(
                                        '2,515',
                                        style: GoogleFonts.robotoSlab(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 18.0),
                                  InkWell(
                                    onTap: () async {
                                      await flickMultiManager.pause();

                                      await imageService.getImage(
                                          source: ImageSource.gallery);

                                      await Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  PageTransition()));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.only(right: 14),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        color: Palette.dark,
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(Icons.upload_outlined),
                                            iconSize: 30.0,
                                            color: Colors.white,
                                            onPressed: () {
                                              print('Upload');
                                            },
                                          ),
                                          Text(
                                            'Use Template',
                                            style: GoogleFonts.robotoSlab(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.bookmark_border),
                                iconSize: 30.0,
                                onPressed: () => print('Save post'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Palette.background,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  _buildComment(0),
                  _buildComment(1),
                  _buildComment(2),
                  _buildComment(3),
                  _buildComment(4),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
        color: Palette.background,
        height: size.height,
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                        width: size.width - 30,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Palette.secondary.withOpacity(0.6),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black.withOpacity(0.8),
                              )),
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.8)),
                          cursorColor: Colors.black.withOpacity(0.8),
                        ),
                      )),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
              cacheExtent: 9999,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: category.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(bottom: 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: CategoryStoryItem(
                                    name: category[index]["genre"],
                                  ))),
                          const SizedBox(
                            height: 5,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(left: 2),
                            child: Wrap(
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.end,
                              spacing: 3,
                              runSpacing: 1,
                              alignment: WrapAlignment.end,
                              children:
                                  List.generate(posts.length, (imageIndex) {
                                var _strImage =
                                    (posts[imageIndex].tooltip == '')
                                        ? getRandomElement(tooltips)
                                        : posts[imageIndex].image;
                                var _image = AssetImage(_strImage);
                                return InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (context) => _buildTemplate(
                                              posts[imageIndex], _strImage));
                                    },
                                    child: Container(
                                      width: (size.width - 3) / 3,
                                      height: (size.width - 3) / 3,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black12,
                                              offset: Offset(0, 0),
                                              blurRadius: 6.0,
                                            ),
                                          ],
                                          image: DecorationImage(
                                              image: _image,
                                              fit: BoxFit.cover)),
                                    ));
                              }),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ]));
              },
            ))
            //     SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: Padding(
            //         padding: const EdgeInsets.only(left: 15),
            //         child: Row(
            //             children: List.generate(searchCategories.length, (index) {
            //           return CategoryStoryItem(
            //             name: searchCategories[index],
            //           );
            //         })),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 15,
            //     ),
            //
          ],
        ));
  }

  Widget makeDismissible({required Widget child}) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(onTap: () {}, child: child),
      );

  Widget _buildVideo(post, _image) {
    Widget child;
    if (post.tooltip != "") {
      child = FlickMultiPlayer(
        url: post.imageUrl,
        flickMultiManager: flickMultiManager,
        image: _image,
      );
    }
    child = FlickMultiPlayer(
      url: post.tooltip,
      flickMultiManager: flickMultiManager,
      image: post.image,
    );
    return child;
  }
}
