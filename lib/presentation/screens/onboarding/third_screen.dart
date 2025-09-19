import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/presentation/widgets/on_boarding_content.dart';
import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: OnBoardingContent(
        imageURL: "assets/images/photo-1630104081456-e5b4e3cb2b9e.jpg",
        title: "Save Your Favourites &\nCook Anytime",
        description:
            "Create your personal recipe collection by saving your favourite recipes. Access them anytime, anywhere, and never miss out on cooking your preferred dishes.",
      ),
    );
  }
}
