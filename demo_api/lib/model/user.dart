import 'package:demo_api/model/user_dob.dart';
import 'package:demo_api/model/user_location.dart';
import 'package:demo_api/model/user_name.dart';
import 'package:demo_api/model/user_picture.dart';

class User {
  late final String gender;
  late final String email;
  late final String phone;
  late final String cell;
  late final String nat;
  late final UserName name;
  late final UserDob dob;
  late final UserLocation location;
  late final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> user) {
    final name = UserName.fromMap(user['name']);

    final dob = UserDob.fromMap(user['dob']);

    final location = UserLocation.fromMap(user['location']);

    final picture = UserPicture.fromMap(user['picture']);

    return User(
      cell: user['cell'],
      email: user['email'],
      gender: user['gender'],
      nat: user['nat'],
      phone: user['phone'],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  String get fullName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
