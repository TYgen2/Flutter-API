import 'dart:ui';

import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String imageUrl;
  const ImageDialog({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Dialog(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(imageUrl).image,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
