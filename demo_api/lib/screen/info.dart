import 'package:demo_api/model/user.dart';
import 'package:demo_api/screen/confidential.dart';
import 'package:demo_api/screen/image_icon.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class InfoPage extends StatelessWidget {
  final User user;
  const InfoPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (_) => ImageDialog(imageUrl: user.picture.large),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.network(user.picture.medium),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: user.name.first,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            WidgetSpan(
                              child: (user.gender == 'male')
                                  ? const Icon(
                                      Icons.male,
                                      color: Colors.blue,
                                    )
                                  : const Icon(
                                      Icons.female,
                                      color: Colors.redAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Text(user.email),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
          ),
          const SizedBox(height: 10),
          const Text(
            'Basic info',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 24,
              fontFamily: 'Shadows',
            ),
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const Text(
                'Full name: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                user.fullName,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Age: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                user.dob.age.toString(),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Date of birth: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                user.dob.date.toString().substring(0, 10),
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'Phone contact: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                user.phone,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SlideAction(
              height: 50,
              borderRadius: 20,
              sliderButtonIconPadding: 5,
              sliderButtonIconSize: 20,
              sliderButtonIcon: const Text(
                'Confidential',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Shadows',
                ),
              ),
              sliderButtonYOffset: -2,
              text: 'Slide to review',
              textColor: Colors.grey[100],
              textStyle: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
              innerColor: Colors.black,
              alignment: Alignment.centerRight,
              sliderRotate: false,
              onSubmit: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ConfidentialPage(
                    user: user,
                  );
                }));
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
