class UserLocation {
  late final String city;
  late final String state;
  late final String country;
  late final String postcode;
  late final LocationCoordinate coordinates;
  late final LocationTimezone timezone;
  late final LocationStreet street;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
    required this.street,
  });

  factory UserLocation.fromMap(Map<String, dynamic> user) {
    final coordinates = LocationCoordinate.fromMap(user['coordinates']);

    final timezone = LocationTimezone.fromMap(user['timezone']);

    final street = LocationStreet.fromMap(user['street']);

    return UserLocation(
      city: user['city'],
      state: user['state'],
      country: user['country'],
      postcode: user['postcode'].toString(),
      coordinates: coordinates,
      timezone: timezone,
      street: street,
    );
  }
}

class LocationCoordinate {
  late final String latitude;
  late final String longitude;

  LocationCoordinate({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinate.fromMap(Map<String, dynamic> user) {
    return LocationCoordinate(
      latitude: user['latitude'],
      longitude: user['longitude'],
    );
  }
}

class LocationTimezone {
  late final String offset;
  late final String description;

  LocationTimezone({
    required this.offset,
    required this.description,
  });

  factory LocationTimezone.fromMap(Map<String, dynamic> user) {
    return LocationTimezone(
      offset: user['offset'],
      description: user['description'],
    );
  }
}

class LocationStreet {
  late final int number;
  late final String name;
  LocationStreet({
    required this.name,
    required this.number,
  });

  factory LocationStreet.fromMap(Map<String, dynamic> user) {
    return LocationStreet(
      name: user['name'],
      number: user['number'],
    );
  }
}
