import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/presentation/widgets/on_boarding_content.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: OnBoardingContent(
        imageURL: "assets/images/photo-1623594629187-2a68392cbab9.jpg",
        title: "Easy Step-by-Step\n Cooking Guides ",
        description:
            "Follow our simple, step-by-step cooking guides to create delicious meals at home. Whether you're a beginner or an experienced cook, our recipes are designed to be easy to follow and fun to make.",
      ),
    );
  }
}
