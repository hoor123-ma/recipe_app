import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  final bool isActive;
  const CustomIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 10,
      width: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isActive ? MyColors.yellow800 : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
