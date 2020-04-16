class User {
  User({ this.uid, this.pictureUrl = 'https://iupac.org/wp-content/uploads/2018/05/default-avatar.png', this.name = 'Anonymous'});

  final String uid;
  final String pictureUrl;
  final String name;
}