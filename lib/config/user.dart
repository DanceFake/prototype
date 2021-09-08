class User {
  String username;
  String noPosts;
  String followers;
  String following;
  String bio;
  String authorImageUrl;

  User({
    required this.username,
    required this.noPosts,
    required this.followers,
    required this.following,
    required this.bio,
    required this.authorImageUrl,
  });
}

User test_user = User(
  username: 'Sam sammy',
  noPosts: '12',
  followers: '123',
  following: '774',
  bio: 'I dont dance',
  authorImageUrl: 'assets/images/user0.png',
);
