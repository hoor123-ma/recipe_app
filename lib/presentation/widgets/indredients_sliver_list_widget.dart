import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class IngredientsSliverListWidget extends StatelessWidget {
  RecipeModel recipe;
  IngredientsSliverListWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Wrap(
            spacing: 3, // المسافة الأفقية بين الـ Chips
            runSpacing: 3, // المسافة الرأسية لو نزلوا لسطر جديد
            children: recipe.ingredients.map((ingredient) {
              return Chip(
                label: Text(
                  ingredient,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                backgroundColor: Colors.orange.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }
}
