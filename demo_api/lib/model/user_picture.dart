class UserPicture {
  late final String large;
  late final String medium;
  late final String thumbnail;

  UserPicture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory UserPicture.fromMap(Map<String, dynamic> user) {
    return UserPicture(
      large: user['large'],
      medium: user['medium'],
      thumbnail: user['thumbnail'],
    );
  }
}
