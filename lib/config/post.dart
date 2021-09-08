import 'dart:math';

import 'package:flutter/material.dart';

class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;
  String likes;
  String comments;
  String tooltip;
  String image;

  Post({
    required this.authorName,
    required this.authorImageUrl,
    required this.timeAgo,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    this.tooltip = '',
    this.image = '',
  });
}

T getRandomElement<T>(List<T> list) {
  final random = new Random();
  var i = random.nextInt(list.length);
  return list[i];
}

var tooltips = [
  'assets/images/donald.png',
  'assets/images/elon.png',
  'assets/images/tiktok.png',
  'assets/images/dance.png',
  'assets/images/dance2.png',
  'assets/images/tik.png',
  'assets/images/post0.jpg',
  'assets/images/user1.png',
  'assets/images/user0.png',
  'assets/images/col.png',
  'assets/images/ti.png',
  'assets/images/bh.png',
  'assets/images/mul.png',
  'assets/images/balle.png',
  'assets/images/inc.png',
  'assets/images/bh2.png',
  'assets/images/yell.png',
  'assets/images/yell2.png',
];
final List<Post> posts = [
  Post(
    authorName: 'Hola Muin',
    authorImageUrl: 'assets/images/user2.png',
    timeAgo: '5 min',
    imageUrl:
        "https://github.com/DanceFake/mock-data/blob/main/assets/videos/JaiHo.mp4?raw=true",
    likes: "2,617",
    comments: "344",
  ),
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '5 min',
    imageUrl:
        "https://github.com/DanceFake/mock-data/blob/main/assets/videos/tiktok2.mp4?raw=true",
    likes: "2,617",
    comments: "344",
  ),
  Post(
    authorName: 'Leo Menon',
    authorImageUrl: 'assets/images/user1.png',
    timeAgo: '10 min',
    imageUrl:
        'https://github.com/DanceFake/mock-data/blob/main/assets/videos/bruno2.mp4?raw=true',
    likes: "2,617",
    tooltip:
        'https://github.com/DanceFake/mock-data/blob/main/assets/templates/bruno2.mp4?raw=true',
    image: 'assets/images/bruno.png',
    comments: "344",
  ),
  Post(
    authorName: 'Bruh Moment',
    authorImageUrl: 'assets/images/user3.png',
    timeAgo: '11 min',
    imageUrl:
        "https://github.com/DanceFake/mock-data/blob/main/assets/videos/bruno.mp4?raw=true",
    likes: "2,617",
    comments: "344",
  ),
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '5 min',
    imageUrl:
        "https://github.com/DanceFake/mock-data/blob/main/assets/videos/tiktok1.mp4?raw=true",
    tooltip: 'this',
    likes: "2,617",
    comments: "344",
  ),
  Post(
    authorName: 'Leo',
    authorImageUrl: 'assets/images/user1.png',
    timeAgo: '10 min',
    imageUrl:
        'https://github.com/DanceFake/mock-data/blob/main/assets/videos/JaiHo-2.mp4?raw=true',
    likes: "2,617",
    comments: "344",
  ),
  Post(
    authorName: 'Hola Muin',
    authorImageUrl: 'assets/images/user2.png',
    timeAgo: '5 min',
    imageUrl:
        "https://github.com/DanceFake/mock-data/blob/main/assets/videos/tiktok3.mp4?raw=true",
    likes: "2,617",
    comments: "344",
  ),
  Post(
    authorName: 'Bruh Moment',
    authorImageUrl: 'assets/images/user3.png',
    timeAgo: '11 min',
    imageUrl:
        "https://github.com/DanceFake/mock-data/blob/main/assets/videos/bruno.mp4?raw=true",
    likes: "2,617",
    comments: "344",
  ),
];
