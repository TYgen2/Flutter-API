class UserDob {
  late final DateTime date;
  late final int age;

  UserDob({
    required this.date,
    required this.age,
  });

  factory UserDob.fromMap(Map<String, dynamic> user) {
    return UserDob(
      age: user['age'],
      date: DateTime.parse(user['date']),
    );
  }
}
