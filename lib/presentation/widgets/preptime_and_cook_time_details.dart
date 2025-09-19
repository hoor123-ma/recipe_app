import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class PreptimeAndCookTimeDetails extends StatelessWidget {
  final RecipeModel recipe;
  const PreptimeAndCookTimeDetails({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Wrap(
            children: [
              Chip(
                backgroundColor: Colors.orange.shade100,
                avatar: Icon(Icons.timer, color: MyColors.yellow800),
                label: Text(
                  "Prep Time: ${recipe.prepTimeMinutes} mins",
                  style: TextStyle(fontSize: 12, color: MyColors.grey),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(width: 8),
              Chip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: Colors.orange.shade100,
                avatar: Icon(Icons.timer, color: MyColors.yellow800),
                label: Text(
                  "Cook Time: ${recipe.cookTimeMinutes} mins",
                  style: TextStyle(fontSize: 12, color: MyColors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
