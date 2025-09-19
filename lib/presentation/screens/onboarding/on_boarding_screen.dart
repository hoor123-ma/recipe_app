import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/constant/strings.dart';
import 'package:breaking_bad_app/presentation/screens/onboarding/first_screen.dart';
import 'package:breaking_bad_app/presentation/screens/onboarding/second_screen.dart';
import 'package:breaking_bad_app/presentation/screens/onboarding/third_screen.dart';
import 'package:breaking_bad_app/presentation/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int activeIndex = 0;
  final PageController _controller = PageController();
  Widget _customOnboardingButton() {
    return SizedBox(
      width: 90,
      height: 90,
      child: InkWell(
        splashColor: Colors.transparent, // يلغي لون الموجة
        highlightColor: Colors.transparent, // يلغي لون التظليل

        onTap: () {
          if (activeIndex < 2) {
            _controller.nextPage(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeInOut,
            );
          } else {
            Navigator.pushReplacementNamed(context, recipesScreen);
          }
        },
        child: Material(
          // ✅ add this
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: MyColors.yellow800,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                activeIndex == 2 ? "Get Started" : "Next",
                style: TextStyle(
                  color: MyColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ✅ use Scaffold to manage layout + background color
      backgroundColor: MyColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => activeIndex = index);
                },
                children: const [FirstScreen(), SecondScreen(), ThirdScreen()],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => CustomIndicator(isActive: activeIndex == index),
              ),
            ),
            const SizedBox(height: 10),
            _customOnboardingButton(),
          ],
        ),
      ),
    );
  }
}
