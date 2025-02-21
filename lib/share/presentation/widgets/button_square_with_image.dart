import 'package:flutter/material.dart';

class ButtonSquareWithImage extends StatelessWidget {
  final String imagePath;
  final double imageSize;
  const ButtonSquareWithImage({
    super.key,
    required this.imagePath,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Image.asset(imagePath, height: imageSize),
    );
  }
}
