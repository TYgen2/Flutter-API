import 'dart:async';

import 'package:demo_api/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ConfidentialPage extends StatelessWidget {
  final User user;
  const ConfidentialPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    String s = user.location.timezone.offset;
    var offset = s != '0:00' ? s.toString().substring(1, s.indexOf(':')) : '0';
    var num = int.parse(offset);
    DateTime now = DateTime.now().add(Duration(hours: num));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context)
            ..pop()
            ..pop(),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Confidential information of',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(10, 10),
          child: Text(
            user.fullName,
            style: const TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
              fontFamily: 'Shadows',
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Divider(),
            const SizedBox(height: 10),
            Container(
              width: 400,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: user.gender == 'male'
                    ? Colors.blue.withOpacity(0.2)
                    : Colors.redAccent.withOpacity(0.2),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Location',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    // Location info and the clock
                    Row(
                      children: [
                        Container(
                          width: 170,
                          height: 180,
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Street: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      '${user.location.street.name.toString()}, ${user.location.street.number.toString()} ',
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'City: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      user.location.city,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'State: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      user.location.state,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Country: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    user.location.country,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Postcode: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    user.location.postcode,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 160,
                          height: 180,
                          color: Colors.transparent,
                          child: AnalogClock.dark(
                            dateTime: now,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 400,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
              ),
              child: const GoogleMap(
                initialCameraPosition: CameraPosition(
                  // Hong Kong
                  target: LatLng(22.3027, 114.1772),
                  zoom: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
