class UserName {
  late final String title;
  late final String first;
  late final String last;

  UserName({
    required this.title,
    required this.first,
    required this.last,
  });

  factory UserName.fromMap(Map<String, dynamic> user) {
    return UserName(
      title: user['title'],
      first: user['first'],
      last: user['last'],
    );
  }
}
