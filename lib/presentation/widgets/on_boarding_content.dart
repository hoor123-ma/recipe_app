import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  final String imageURL;
  final String title;
  final String description;

  const OnBoardingContent({
    super.key,
    required this.imageURL,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.asset(
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                imageURL,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 24, color: MyColors.grey),
            textAlign: TextAlign.center,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
