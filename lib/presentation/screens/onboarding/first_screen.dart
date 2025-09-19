import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/constant/strings.dart';
import 'package:breaking_bad_app/presentation/widgets/on_boarding_content.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: OnBoardingContent(
        imageURL: "assets/images/photo-1734330932655-e6f3e7aff297.jpg",
        title: "Discover Delicious \n Recipes",
        description:
            "Explore a world of culinary delights with our recipe app. From quick and easy meals to gourmet dishes, find inspiration for every occasion.",
      ),
    );
  }
}
